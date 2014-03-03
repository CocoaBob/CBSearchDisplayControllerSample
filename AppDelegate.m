#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation AppDelegate;

@synthesize window,tabBarController;

- (void)dealloc
{
    [window release];
    [super dealloc];
}


- (void)applicationDidFinishLaunching:(UIApplication *)application
{	
	tabBarController = [[UITabBarController alloc] init];
	
	FirstViewController *firstViewController = [[FirstViewController alloc] initWithNibName:nil bundle:nil];
	UINavigationController *firstNavigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
	[firstViewController release];
	
	SecondViewController *secondViewController = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
	UINavigationController *secondNavigationController = [[UINavigationController alloc] initWithRootViewController:secondViewController];
	[secondViewController release];
	
	tabBarController.viewControllers = [NSArray arrayWithObjects:firstNavigationController,secondNavigationController,nil];
	
	[window addSubview:tabBarController.view];
	[window makeKeyAndVisible];
}


@end
