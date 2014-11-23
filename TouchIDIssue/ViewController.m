//
//  ViewController.m
//  TouchIDIssue
//
//  Created by liuge on 11/23/14.
//  Copyright (c) 2014 iLegendSoft. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([[self.navigationController.viewControllers firstObject] isEqual:self]) {
        self.navigationItem.title = @"ViewController1";
        LAContext *context = [LAContext new];
        
        NSError *error;
        
        context.localizedFallbackTitle = @"";// Cancel "Enter Password" option(cannot set as nil)
        
        if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:NSLocalizedString(@"Use Touch ID to log in.", nil) reply:^(BOOL success, NSError *error) {
                if (success) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        ViewController *vc2 = [[ViewController alloc] init];
                        [self.navigationController pushViewController:vc2 animated:YES];
                    });
                }
            }];
        } else {
            NSLog(@"Touch ID is not available: %@", error);
        }
    } else {
        self.navigationItem.title = @"ViewController2";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
