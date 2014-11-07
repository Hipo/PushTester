//
//  AppDelegate.m
//  PushTester
//
//  Created by Taylan Pince on 2014-11-05.
//  Copyright (c) 2014 Hipo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"


@interface AppDelegate ()

@property (nonatomic, strong) ViewController *rootController;

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _rootController = [[ViewController alloc] init];
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [_window setRootViewController:_rootController];
    [_window setBackgroundColor:[UIColor whiteColor]];
    [_window makeKeyAndVisible];
    
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings
                                                settingsForTypes:(UIUserNotificationTypeBadge |
                                                                  UIUserNotificationTypeSound |
                                                                  UIUserNotificationTypeAlert)
                                                categories:nil];
        
        [application registerUserNotificationSettings:settings];
    } else {
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert |
                                                         UIRemoteNotificationTypeBadge |
                                                         UIRemoteNotificationTypeSound)];
    }
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [_rootController.messageView setText:userInfo[@"aps"][@"alert"]];
    [_rootController.dateLabel setText:[NSDateFormatter localizedStringFromDate:[NSDate date]
                                                                      dateStyle:NSDateFormatterLongStyle
                                                                      timeStyle:NSDateFormatterLongStyle]];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    const unsigned *tokenBytes = [deviceToken bytes];
    NSString *pushToken = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
                           ntohl(tokenBytes[0]), ntohl(tokenBytes[1]), ntohl(tokenBytes[2]),
                           ntohl(tokenBytes[3]), ntohl(tokenBytes[4]), ntohl(tokenBytes[5]),
                           ntohl(tokenBytes[6]), ntohl(tokenBytes[7])];
    
    [_rootController.tokenView setText:pushToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [_rootController.tokenView setText:[error localizedDescription]];
}

@end
