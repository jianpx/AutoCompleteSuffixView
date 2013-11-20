//
//  ViewController.m
//  AutoCompleteSuffixSample
//
//  Created by jianpx on 11/17/13.
//  Copyright (c) 2013 PS. All rights reserved.
//

#import "ViewController.h"
#import "AutoCompleteSuffixView.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    NSArray *suffixs = @[@"163.com", @"qq.com", @"126.com", @"vip.188.com"];
    AutoCompleteSuffixView *autoBindUrs = [[AutoCompleteSuffixView alloc] initWithInputField:self.ursTextField
                                                                           suffixs:suffixs];
    [self.view addSubview:autoBindUrs];

    //you can use the original UITextField's delegate too.
    self.ursTextField.delegate = self;
}

//this UITextField Delegate method just to show UITextField's delegate has not been change or hack.
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"text input;%@", textField.text);
    return YES;
}
@end
