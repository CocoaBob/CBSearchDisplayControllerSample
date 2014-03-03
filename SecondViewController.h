#import <UIKit/UIKit.h>

#import "Product.h"

@interface SecondViewController : UITableViewController <UISearchDisplayDelegate, UISearchBarDelegate>
{
	NSArray						*listContent;			// The master content.
	NSMutableArray				*filteredListContent;	// The content filtered as a result of a search.
	
	UISearchDisplayController	*searchDisplayController;
}

@property (nonatomic, retain) NSArray *listContent;
@property (nonatomic, retain) NSMutableArray *filteredListContent;
@property (nonatomic, retain) UISearchDisplayController	*searchDisplayController;

@end
