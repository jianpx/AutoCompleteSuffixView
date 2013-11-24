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
/* 
 when maxDisplayHeight is set to positive value, if AutoCompleteSuffixView's 
 frame height is greater than maxDisplayHeight, use maxDisplayHeight and 
 user should scroll now to get bottom suggestion, else the frame's height will
 dynamically change according the count of suggestions.
 
 when maxDisplayHeight is set to negative value or not set, the AutoCompleteSuffixView's
 frame height will dynamically change according the count of suggestions.
 */
@property (nonatomic) CGFloat maxDisplayHeight;

//should use this init, any other init method will not work.
- (id)initWithInputField:(UITextField *)inputField suffixs:(NSArray *)suffixs;
@end
