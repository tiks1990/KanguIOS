//
//  AppDelegate.m
//  Kangu
//
//  Created by Heinz Sohm on 1/5/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import <FacebookSDK/FacebookSDK.h>
NSString *const BFTaskMultipleExceptionsException = @"BFMultipleExceptionsException";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // [Optional] Power your app with Local Datastore. For more info, go to
    // https://parse.com/docs/ios_guide#localdatastore/iOS
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"36iVDGX5hS3ENDt3kypLZd4RSMkS2qDaiDEoxcGb"
                  clientKey:@"9v6OCdmGRdTaceyIsIHaTXhY32x6EX6pxf99rQ2M"];
    [PFFacebookUtils initializeFacebook];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    /*
    _movintracks=[[MTMovintracks alloc] initWithRootServer:@"app.movintracks.io" ApiKey:@"a2dadf42d8639dcac667933d50429853" andApiSecret:@"92fe3484471ceab9596184c1055e0572c3a590d8" withLaunchingOptions:launchOptions];
     */
    
    // Check if we are using ios8
    if ([application respondsToSelector:@selector(registerForRemoteNotifications)]){
        // Register remote notifications in iOS8
        [application registerForRemoteNotifications];
        // Ask user enable notifications in notification manager
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeSound|UIUserNotificationTypeAlert categories: nil]];
    } else {
        // Register to obtain push silent notifications
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeNewsstandContentAvailability];
    }
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
    //[_movintracks applicationDidBecomeActive];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    //[_movintracks applicationDidReceiveLocalNotification:notification];
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
   // [_movintracks setPushToken:deviceToken];
   // NSLog(@"My token is: %@", deviceToken);
}
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
   // BOOL r = [_movintracks applicationDidReceiveRemoteNotification: userInfo];

}
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    //[_movintracks setPushToken:nil];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

@end
