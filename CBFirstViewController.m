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


- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks
                                                                                           target:self
                                                                                           action:@selector(go:)];
    
    // iOS 7 compatibility
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    if ([self respondsToSelector:@selector(extendedLayoutIncludesOpaqueBars)])
        self.extendedLayoutIncludesOpaqueBars = NO;
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)])
        self.automaticallyAdjustsScrollViewInsets = NO;
}

- (IBAction)go:(id)sender{
	// Create the master list for the main view controller.
	NSArray *listContent = @[
                             [CBProduct productWithType:@"iPad" name:@"iPad"],
                             [CBProduct productWithType:@"iPad" name:@"iPad 2"],
                             [CBProduct productWithType:@"iPad" name:@"The new iPad"],
                             [CBProduct productWithType:@"iPad" name:@"iPad 4"],
                             [CBProduct productWithType:@"iPad" name:@"iPad Air"],
                             [CBProduct productWithType:@"iPad" name:@"iPad mini"],
                             [CBProduct productWithType:@"iPad" name:@"iPad mini with Retina display"],
                             [CBProduct productWithType:@"iPhone" name:@"iPhone"],
                             [CBProduct productWithType:@"iPhone" name:@"iPhone 3G"],
                             [CBProduct productWithType:@"iPhone" name:@"iPhone 3GS"],
                             [CBProduct productWithType:@"iPhone" name:@"iPhone 4"],
                             [CBProduct productWithType:@"iPhone" name:@"iPhone 4s"],
                             [CBProduct productWithType:@"iPhone" name:@"iPhone 5"],
                             [CBProduct productWithType:@"iPhone" name:@"iPhone 5c"],
                             [CBProduct productWithType:@"iPhone" name:@"iPhone 5s"],
                             [CBProduct productWithType:@"iPod" name:@"iPod classic"],
                             [CBProduct productWithType:@"iPod" name:@"iPod nano"],
                             [CBProduct productWithType:@"iPod" name:@"iPod shuffle"],
                             [CBProduct productWithType:@"iPod" name:@"iPod touch"],
                             [CBProduct productWithType:@"Mac" name:@"iMac"],
                             [CBProduct productWithType:@"Mac" name:@"Mac mini"],
                             [CBProduct productWithType:@"Mac" name:@"Mac Pro"],
                             [CBProduct productWithType:@"Mac" name:@"Macbook"],
                             [CBProduct productWithType:@"Mac" name:@"Macbook Air"],
                             [CBProduct productWithType:@"Mac" name:@"Macbook Pro"],
                             [CBProduct productWithType:@"Mac" name:@"MacBook Pro with Retina display"],
                            ];
	
	
	// Create and configure the main view controller.
	CBSecondViewController *secondViewController = [[CBSecondViewController alloc] init];
	secondViewController.listContent = listContent;

	[self.navigationController pushViewController:secondViewController animated:YES];
}

@end
