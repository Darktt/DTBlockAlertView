// DTBlockAlertView.m
// 
// Copyright (c) 2013 Darktt Personal Company
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//   http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "DTBlockAlertView.h"

@interface DTBlockAlertView () <UIAlertViewDelegate>
{
    DTAlertViewButtonClickedBlock _block;
}

@end

@implementation DTBlockAlertView

+ (id)alertViewUseBlock:(DTAlertViewButtonClickedBlock)block title:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    DTBlockAlertView *alertView = [[[DTBlockAlertView alloc] initWithUseBlock:block title:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil] autorelease];
    
    va_list args;
    
    NSString *buttonTitle = otherButtonTitles;
    
    va_start(args, otherButtonTitles);
    
    do {
        
        [alertView addButtonWithTitle:buttonTitle];
        buttonTitle = va_arg(args, NSString *);
        
    } while (buttonTitle != nil);
    
    va_end(args);
    
    return alertView;
}

- (id)initWithUseBlock:(DTAlertViewButtonClickedBlock)block title:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if (self == nil) return nil;
    
    _block = Block_copy(block);
    
    if (otherButtonTitles == nil) {
        return self;
    }
    
    va_list args;
    
    NSString *buttonTitle = otherButtonTitles;
    
    va_start(args, otherButtonTitles);
    
    do {
        
        [self addButtonWithTitle:buttonTitle];
        buttonTitle = va_arg(args, NSString *);
        
    } while (buttonTitle != nil);
    
    va_end(args);
    
    return self;
}

- (void)dealloc
{
    Block_release(_block);
    
    [super dealloc];
}

#pragma mark - UIAlertView Delegate Method

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    _block(self, buttonIndex, self.cancelButtonIndex);
}

@end
