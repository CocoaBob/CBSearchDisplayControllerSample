#import "FirstViewController.h"


@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle{
    self = [super initWithNibName:nibName bundle:nibBundle];
    if (self) {
		self.title = @"First";
		self.navigationController.navigationBarHidden = NO;
    }
    return self;
}

- (void)viewDidLoad {
	UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
																					target:self
																					action:@selector(go:)];
	self.navigationItem.rightBarButtonItem = rightBarButton;
}

- (IBAction)go:(id)sender{
	// Create the master list for the main view controller.
	NSArray *listContent = [[NSArray alloc] initWithObjects:
							[Product productWithType:@"Device" name:@"iPhone"],
							[Product productWithType:@"Device" name:@"iPod"],
							[Product productWithType:@"Device" name:@"iPod touch"],
							[Product productWithType:@"Desktop" name:@"iMac"],
							[Product productWithType:@"Desktop" name:@"Mac Pro"],
							[Product productWithType:@"Portable" name:@"iBook"],
							[Product productWithType:@"Portable" name:@"MacBook"],
							[Product productWithType:@"Portable" name:@"MacBook Pro"],
							[Product productWithType:@"Portable" name:@"PowerBook"], nil];
	
	
	// Create and configure the main view controller.
	SecondViewController *secondViewController = [[SecondViewController alloc] init];
	secondViewController.listContent = listContent;
	[listContent release];

	[self.navigationController pushViewController:secondViewController animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)dealloc {
    [super dealloc];
}


@end
