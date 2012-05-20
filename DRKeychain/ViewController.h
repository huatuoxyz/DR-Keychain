//
//  ViewController.h
//  DRKeychain
//
//  Created by Dongri Jin on 12/05/20.
//  Copyright (c) 2012年 @dongriab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UITextField *account;
    IBOutlet UITextField *password;
    IBOutlet UITextField *service;
    IBOutlet UITextField *group;
    IBOutlet UITextView *logview;
}

@property (nonatomic, retain) IBOutlet UITextField *account;
@property (nonatomic, retain) IBOutlet UITextField *password;
@property (nonatomic, retain) IBOutlet UITextField *service;
@property (nonatomic, retain) IBOutlet UITextField *group;
@property (nonatomic, retain) IBOutlet UITextView  *logview;

- (IBAction)updateItem;
- (IBAction)deleteItem;
- (IBAction)getItem;
- (IBAction)dumpItems;

@end
