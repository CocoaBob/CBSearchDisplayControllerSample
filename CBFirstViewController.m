//
//  FirstViewController.m
//  TableSearch
//
//  Created by CocoaBob on 07/13/09.
//  Copyright 2009 CocoaBob. All rights reserved.
//

#import "CBFirstViewController.h"

#import "CBSecondViewController.h"
#import "CBProduct.h"

@implementation CBFirstViewController

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
    self = [super initWithNibName:nibName bundle:nibBundle];
    if (self) {
		self.title = @"First";
		self.navigationController.navigationBarHidden = NO;
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (void)viewDidLoad {
	UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks
																					target:self
																					action:@selector(go:)];
	self.navigationItem.rightBarButtonItem = rightBarButton;
    [rightBarButton release];
    
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

- (IBAction)go:(id)sender{
	// Create the master list for the main view controller.
	NSArray *listContent = [[NSArray alloc] initWithObjects:
							[CBProduct productWithType:@"Device" name:@"iPhone"],
							[CBProduct productWithType:@"Device" name:@"iPod"],
							[CBProduct productWithType:@"Device" name:@"iPod touch"],
							[CBProduct productWithType:@"Desktop" name:@"iMac"],
							[CBProduct productWithType:@"Desktop" name:@"Mac Pro"],
							[CBProduct productWithType:@"Portable" name:@"iBook"],
							[CBProduct productWithType:@"Portable" name:@"MacBook"],
							[CBProduct productWithType:@"Portable" name:@"MacBook Pro"],
							[CBProduct productWithType:@"Portable" name:@"PowerBook"], nil];
	
	
	// Create and configure the main view controller.
	CBSecondViewController *secondViewController = [[CBSecondViewController alloc] init];
	secondViewController.listContent = listContent;
	[listContent release];

	[self.navigationController pushViewController:secondViewController animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

@end
