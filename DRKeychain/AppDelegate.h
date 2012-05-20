//
//  AppDelegate.h
//  DRKeychain
//
//  Created by Dongri Jin on 12/05/20.
//  Copyright (c) 2012年 @dongriab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    ViewController *viewController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) ViewController *viewController;

@end
