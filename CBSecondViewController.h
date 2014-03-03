//
//  SecondViewController.h
//  TableSearch
//
//  Created by CocoaBob on 07/13/09.
//  Copyright 2009 CocoaBob. All rights reserved.
//

@interface CBSecondViewController : UITableViewController <UISearchDisplayDelegate, UISearchBarDelegate>

@property (nonatomic, retain) NSArray *listContent; // The master content.
@property (nonatomic, retain) NSMutableArray *filteredListContent; // The content filtered as a result of a search.
@property (nonatomic, retain) UISearchDisplayController	*retainedSearchDisplayController;

@end
