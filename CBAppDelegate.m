//
//  AppDelegate.m
//  TableSearch
//
//  Created by CocoaBob on 07/13/09.
//  Copyright 2009 CocoaBob. All rights reserved.
//

#import "CBAppDelegate.h"
#import "CBFirstViewController.h"
#import "CBSecondViewController.h"

@implementation CBAppDelegate;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	self.tabBarController = [[[UITabBarController alloc] initWithNibName:nil bundle:nil] autorelease];
	
	CBFirstViewController *firstViewController = [[CBFirstViewController alloc] initWithNibName:nil bundle:nil];
	UINavigationController *firstNavigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
	[firstViewController release];
	
	CBSecondViewController *secondViewController = [[CBSecondViewController alloc] initWithNibName:nil bundle:nil];
	UINavigationController *secondNavigationController = [[UINavigationController alloc] initWithRootViewController:secondViewController];
	[secondViewController release];
	
	self.tabBarController.viewControllers = @[firstNavigationController,secondNavigationController];
//    self.tabBarController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.window setRootViewController:self.tabBarController];

	[self.window makeKeyAndVisible];
}


@end
