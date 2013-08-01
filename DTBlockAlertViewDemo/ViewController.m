//
//  ViewController.m
//  DTBlockAlertView
//
//  Created by Darktt on 13/8/1.
//  Copyright (c) 2013 Darktt Personal Company. All rights reserved.
//

#import "ViewController.h"
#import "DTBlockAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    DTAlertViewButtonClickedBlock block = ^(NSUInteger buttonIndex, NSUInteger cancelButtonIndex){
        NSString *message;
        
        if (buttonIndex == cancelButtonIndex) {
            message = @"You clicked cancel button !";
        } else {
            message = @"You clicked OK button !";
        }
        
        UIAlertView *_alertView = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [_alertView show];
        [_alertView release];
    };
    
    DTBlockAlertView *alertView = [DTBlockAlertView alertViewUseBlock:block title:@"Demo" message:@"This an alert !" cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
