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
	self.tabBarController = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
	
	CBFirstViewController *firstViewController = [[CBFirstViewController alloc] initWithNibName:nil bundle:nil];
	UINavigationController *firstNavigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
	
	CBSecondViewController *secondViewController = [[CBSecondViewController alloc] initWithNibName:nil bundle:nil];
	UINavigationController *secondNavigationController = [[UINavigationController alloc] initWithRootViewController:secondViewController];
	
	self.tabBarController.viewControllers = @[firstNavigationController,secondNavigationController];
    [self.window setRootViewController:self.tabBarController];

	[self.window makeKeyAndVisible];
}


@end
