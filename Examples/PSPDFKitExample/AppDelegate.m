//
//  AppDelegate.m
//  PSPDFKitExample
//
//  Created by Peter Steinberger on 7/22/11.
//  Copyright 2011 Peter Steinberger. All rights reserved.
//

#import "AppDelegate.h"
#import "PSPDFGridController.h"
#import "PSPDFNavigationController.h"

@implementation AppDelegate

@synthesize window = window_;
@synthesize navigationController = navigationController_;

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - NSObject

- (void)dealloc {
    [gridController_ release];
    [window_ release];
    [navigationController_ release];
    [super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UIApplicationDelegate

- (void)updateFolders; {    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        if (gridController_) {
            [gridController_.gridView reloadData];
        }
    });
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        
    // uncomment to enable PSPDFKitLogging. Defaults to PSPDFLogLevelError
    kPSPDFKitDebugLogLevel = PSPDFLogLevelInfo;
    
    // enable to see the scrollviews semi-transparent
    //kPSPDFKitDebugScrollViews = YES;
    
    // enable to change anomations (e.g. enable on iPad1)
    //kPSPDFAnimateOption = PSPDFAnimateEverywhere;
    
    // create main grid and show!
    gridController_ = [[PSPDFGridController alloc] init];
    navigationController_ = [[PSPDFNavigationController alloc] initWithRootViewController:gridController_];
    window_ = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    window_.rootViewController = navigationController_;
    [window_ makeKeyAndVisible];
        
    NSString *cacheFolder = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    PSELog(@"CacheDir: %@", cacheFolder);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end