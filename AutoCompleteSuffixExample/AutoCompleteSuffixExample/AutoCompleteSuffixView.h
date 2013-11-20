//
//  AutoCompleteSuffix.h
//  AutoCompleteSuffixSample
//
//  Created by jianpx on 11/17/13.
//  Copyright (c) 2013 PS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoCompleteSuffixView : UITableView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITextField *bindedTextField;
@property (nonatomic, strong) NSArray *suffixs;
@property (nonatomic) BOOL roundedBorder; //default YES

//should use this init, any other init method will not work.
- (id)initWithInputField:(UITextField *)inputField suffixs:(NSArray *)suffixs;
@end
