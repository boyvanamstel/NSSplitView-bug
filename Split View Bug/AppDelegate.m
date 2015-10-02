//
//  AppDelegate.m
//  Split View Bug
//
//  Created by Boy van Amstel on 02/10/15.
//  Copyright © 2015 Danger Cove. All rights reserved.
//

#import "AppDelegate.h"

#import "DCOSplitViewViewController.h"

//#define SHOW_WORKING

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSWindow *buggyWindow;;
@property (weak) IBOutlet NSWindow *workingWindow;

@property (strong) NSViewController *splitViewViewController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Insert code here to initialize your application

#ifdef SHOW_WORKING
  self.window = self.workingWindow;
  [self.window makeKeyAndOrderFront:nil];
#else
  self.window = self.buggyWindow;
  [self.window makeKeyAndOrderFront:nil];
  // Add SplitView view controller
  self.splitViewViewController = [[DCOSplitViewViewController alloc] init];
  NSView *view = self.splitViewViewController.view;
  NSView *contentView = self.window.contentView;
  view.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
  view.frame = contentView.bounds;
  [contentView addSubview:view];
#endif
  
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}

@end
