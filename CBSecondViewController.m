//
//  SecondViewController.m
//  TableSearch
//
//  Created by CocoaBob on 07/13/09.
//  Copyright 2009 CocoaBob. All rights reserved.
//

#import "CBSecondViewController.h"
#import "CBProduct.h"

@implementation CBSecondViewController

#pragma mark - Lifecycle methods

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
    self = [super initWithNibName:nibName bundle:nibBundle];
    if (self) {
		self.title = @"Second";
		self.navigationController.navigationBarHidden = NO;
    }
    return self;
}

- (void)dealloc {
	self.listContent = nil;
	self.filteredListContent = nil;
	[super dealloc];
}

#pragma mark - UIViewController methods

- (void)viewDidLoad {
	self.filteredListContent = [[[NSMutableArray alloc] init] autorelease];
	
	UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
																					target:self
																					action:@selector(showSearchBar:)];
	self.navigationItem.rightBarButtonItem = rightBarButton;
    [rightBarButton release];
	
	UISearchBar *mySearchBar = [[[UISearchBar alloc] init] autorelease];
	[mySearchBar setScopeButtonTitles:@[@"All",@"Device",@"Desktop",@"Portable"]];
	[mySearchBar setDelegate:self];
	[mySearchBar setAutocapitalizationType:UITextAutocapitalizationTypeNone];
	self.tableView.tableHeaderView = mySearchBar;
	/*
	 fix the search bar width problem in landscape screen
	 */
	if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeRight ||
		[[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeLeft) {
		self.tableView.tableHeaderView.frame = CGRectMake(0.f, 0.f, CGRectGetHeight(self.tableView.frame), 44.f);
	}
	else {
		self.tableView.tableHeaderView.frame = CGRectMake(0.f, 0.f, CGRectGetWidth(self.tableView.frame), 44.f);
	}
	/*
	 set up the searchDisplayController programmatically
	 */
	self.retainedSearchDisplayController = [[[UISearchDisplayController alloc] initWithSearchBar:mySearchBar contentsController:self] autorelease];
	[self.searchDisplayController setDelegate:self];
	[self.searchDisplayController setSearchResultsDataSource:self];
	
	[self.tableView reloadData];

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    // iOS 7 compatibility
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    if ([self respondsToSelector:@selector(extendedLayoutIncludesOpaqueBars)])
        self.extendedLayoutIncludesOpaqueBars = NO;
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)])
        self.automaticallyAdjustsScrollViewInsets = NO;
#endif
}

- (void)viewWillAppear:(BOOL)animated {
    /*
     Hide the search bar
     */
    [self.tableView setContentOffset:CGPointMake(0, 44.f) animated:NO];
	
	NSIndexPath *tableSelection = [self.tableView indexPathForSelectedRow];
	[self.tableView deselectRowAtIndexPath:tableSelection animated:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

#pragma mark - UITableView data source and delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.filteredListContent count];
    }
	else {
        return [self.listContent count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *kCellID = @"cellID";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	CBProduct *product = nil;
	if (tableView == self.searchDisplayController.searchResultsTableView) {
        product = [self.filteredListContent objectAtIndex:indexPath.row];
    }
	else {
        product = [self.listContent objectAtIndex:indexPath.row];
    }
	
	cell.textLabel.text = product.name;
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *detailsViewController = [[UIViewController alloc] init];
    
	CBProduct *product = nil;
	if (tableView == self.searchDisplayController.searchResultsTableView) {
        product = [self.filteredListContent objectAtIndex:indexPath.row];
    }
	else {
        product = [self.listContent objectAtIndex:indexPath.row];
    }
	detailsViewController.title = product.name;
    
    [[self navigationController] pushViewController:detailsViewController animated:YES];
    [detailsViewController release];
}

#pragma mark - Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
	/*
	 Update the filtered array based on the search text and scope.
	 */
	
	[self.filteredListContent removeAllObjects];// First clear the filtered array.
	
	/*
	 Search the main list for products whose type matches the scope (if selected) and whose name matches searchText; add items that match to the filtered array.
	 */
	for (CBProduct *product in self.listContent) {
		if ([scope isEqualToString:@"All"] || [product.type isEqualToString:scope]) {
			NSComparisonResult result = [product.name compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
            if (result == NSOrderedSame) {
				[self.filteredListContent addObject:product];
            }
		}
	}
}

#pragma mark - UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self filterContentForSearchText:searchString
                               scope:[self.searchDisplayController.searchBar scopeButtonTitles][[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text]
                               scope:[self.searchDisplayController.searchBar scopeButtonTitles][searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller {
	/*
	Bob: In iOS 3, the searchResultsTableView will be released and allocated automatically, so each time we start to begin search, we set its delegate here.
	*/
	[self.searchDisplayController.searchResultsTableView setDelegate:self];
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller {
    /*
     Hide the search bar
     */
    [self.tableView setContentOffset:CGPointMake(0, 44.f) animated:YES];
}

#pragma mark - Actions

-(IBAction)showSearchBar:(id)sender {
    // http://stackoverflow.com/questions/19245779/search-bar-cancel-button-dont-work-in-ios-7-sometimes
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending) {
        CGPoint contentOffset = self.tableView.contentOffset;
        contentOffset.y = 0;
        [self.tableView setContentOffset:contentOffset animated:NO];
    }

	[self.searchDisplayController setActive:YES animated:YES];
}

@end
