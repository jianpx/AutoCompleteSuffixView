//
//  AutoCompleteSuffix.m
//  AutoCompleteSuffixSample
//
//  Created by jianpx on 11/17/13.
//  Copyright (c) 2013 PS. All rights reserved.
//

#import "AutoCompleteSuffixView.h"
#import <QuartzCore/QuartzCore.h>

@interface AutoCompleteSuffixView()
@property (nonatomic, strong) NSMutableArray *suggestions;
@end

@implementation AutoCompleteSuffixView

- (id)initWithInputField:(UITextField *)inputField suffixs:(NSArray *)suffixs
{
    CGRect frame = inputField.frame;
    CGFloat rowHeight = 33;
    NSUInteger count = suffixs ? suffixs.count : 0;
    CGRect tableViewFrame = CGRectMake(frame.origin.x, frame.origin.y + frame.size.height, frame.size.width, rowHeight * count);
    self = [super initWithFrame:tableViewFrame style:UITableViewStylePlain];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.showsVerticalScrollIndicator = NO;
        self.rowHeight = rowHeight;
        self.hidden = YES;
        _suffixs = suffixs;
        _bindedTextField = inputField;
        _bindedTextField.placeholder = @"如name@example.com";
        _roundedBorder = YES;
        self.layer.cornerRadius = 8;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleTextChange:)
                                                     name:UITextFieldTextDidChangeNotification
                                                   object:_bindedTextField];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:self.bindedTextField];
}

- (void)setRoundedBorder:(BOOL)roundedBorder
{
    _roundedBorder = roundedBorder;
    self.layer.cornerRadius = _roundedBorder ? 8 : 0;
}

- (NSArray *)suffixs
{
    if (!_suffixs) {
        _suffixs = [[NSArray alloc] init];
    }
    return _suffixs;
}

- (NSMutableArray *)suggestions
{
    if (!_suggestions) {
        _suggestions = [[NSMutableArray alloc] init];
    }
    return _suggestions;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.suggestions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SuggestionTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = self.suggestions[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.bindedTextField.text = self.suggestions[indexPath.row];
    self.hidden = YES;
    [self.bindedTextField resignFirstResponder];
}

#pragma mark - Auto Complete Suggestion
- (void)updateSuggestionList:(NSString *)input
{
    NSUInteger at = [input rangeOfString:@"@"].location;
    if (at == NSNotFound) {
        at = [input length];
    }
    NSString *name = [input substringWithRange:NSMakeRange(0, at)];

    [self.suggestions removeAllObjects];
    for (int i = 0; i < self.suffixs.count; i++) {
        NSString *candidate = [NSString stringWithFormat:@"%@@%@", name, self.suffixs[i]];
        if ([candidate hasPrefix:input]) {
            [self.suggestions addObject:candidate];
        }
    }

    [self reloadData];

    if (self.suggestions.count == 0 ||
        (self.suggestions.count == 1 && [self.suggestions[0] isEqualToString:input])) {
        self.hidden = YES;
    } else {
        self.hidden = NO;
    }
}

- (void)handleTextChange:(NSNotification *)notification
{
    UITextField *textField = (UITextField *)notification.object;
    /*
     UITextFieldTextDidChangeNotification is a system notification, any UITextField's content change will post
     this notification, so here we need to check whether the UITextField is my target.
    */
    if (textField == self.bindedTextField) {
        [self updateSuggestionList:textField.text];
    }
}
@end