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
@property (nonatomic, strong) AutoCompleteSuffixView *autoCompleteSuffixView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    NSArray *suffixs = @[@"163.com", @"qq.com", @"126.com", @"vip.188.com", @"188.com"];
    self.autoCompleteSuffixView = [[AutoCompleteSuffixView alloc] initWithInputField:self.ursTextField
                                                                           suffixs:suffixs];
    //you can custom style too.
#if 0
    self.autoCompleteSuffixView.rowHeight = 20;
    self.autoCompleteSuffixView.roundedBorder = NO;
#endif
    [self.view addSubview:self.autoCompleteSuffixView];

    //you can use the original UITextField's delegate too.
    self.ursTextField.delegate = self;
}

#pragma mark - UITextField delegate method.
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.autoCompleteSuffixView.hidden = YES;
    [self.ursTextField resignFirstResponder];
    return YES;
}

/*
 override this method just to hide keyboard whereever you click the background of the view.
 it has no relationship with AutoCompleteSuffixView.
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    self.autoCompleteSuffixView.hidden = YES;
}
@end
