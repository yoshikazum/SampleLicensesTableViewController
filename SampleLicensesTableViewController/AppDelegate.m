//
//  AppDelegate.m
//  SampleLicensesTableViewController
//
//  Created by 三好 良和 on 12/02/11.
//  Copyright (c) 2012年 Yoshikazu Miyoshi. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize navigationController = navigationController_;

- (void)dealloc
{
  [_window release];
  [_viewController release];
  [navigationController_ release];
  [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  DBG_HERE
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    self.viewController = [[[ViewController alloc]init]autorelease];
        //[[[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil] autorelease];
  } else {
    self.viewController = [[[ViewController alloc]init]autorelease];
        //[[[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil] autorelease];
  }
  self.viewController.title = @"Sample";
  //UIViewController *rootViewController = [[[UIViewController alloc]init]autorelease];
  self.navigationController = [[[UINavigationController alloc]initWithRootViewController:self.viewController]autorelease];
//  [nc pushViewController:self.viewController animated:YES];
  [self.window addSubview:self.navigationController.view];
  //[self.window addSubview:self.viewController.view];
  [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
