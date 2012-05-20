//
//  ViewController.m
//  DRKeychain
//
//  Created by Dongri Jin on 12/05/20.
//  Copyright (c) 2012年 @dongriab. All rights reserved.
//
#import  <QuartzCore/QuartzCore.h>
#import "ViewController.h"
#import <Security/Security.h>
#import "DRKeychain.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize account, password, service, group, logview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    logview.layer.borderWidth = 1;
    logview.layer.borderColor = [[UIColor blackColor] CGColor];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)hideKeyboard{
    [account resignFirstResponder];
    [password resignFirstResponder];
    [service resignFirstResponder];
    [group resignFirstResponder];
}
- (IBAction)updateItem{
    [self hideKeyboard];
    if (![self.group.text isEqualToString:@""]){
        [DRKeychain updateValue:self.password.text account:self.account.text service:self.service.text group:self.group.text];
    }else{
        [DRKeychain updateValue:self.password.text account:self.account.text service:self.service.text];
    }
    [self dumpItems];
}

- (IBAction)deleteItem {
    [self hideKeyboard];
    if (![self.group.text isEqualToString:@""]){
        [DRKeychain deleteValueWithAccount:self.account.text service:self.service.text group:self.group.text];
    }else{
        [DRKeychain deleteValueWithAccount:self.account.text service:self.service.text];
    }
    [self dumpItems];
}

- (IBAction)getItem {
    [self hideKeyboard];
    if (![self.group.text isEqualToString:@""]){
        NSString *str = [DRKeychain getValueWithAccount:self.account.text service:self.service.text group:self.group.text];
        [self.password setText:str];
    }else{
        NSString *str = [DRKeychain getValueWithAccount:self.account.text service:self.service.text];
        [self.password setText:str];
    }
}

- (IBAction)dumpItems {
    [self hideKeyboard];
    self.logview.text = [NSString stringWithFormat:@"%@", [DRKeychain getItemsWithService:self.service.text]];
}

@end
