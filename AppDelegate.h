@interface AppDelegate : NSObject <UIApplicationDelegate>
{
	UIWindow *window;
    UITabBarController *tabBarController;	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
