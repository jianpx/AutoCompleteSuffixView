AutoCompleteSuffixView
======================

# Introduction
AutoCompleteSuffixView helps to complete account's suffix automatically when user type characters in UITextField. For more details, please see the screenshot below.

# Installation
* Normal installation

  * put AutoCompleteSuffixView.h and AutoCompleteSuffixView.m ([here]())into your project.

* CocoaPods style installation
  1. Install CocoaPods if you do not have it installed.

    * `$[sudo] gem install cocoapods`
    * `$ pod setup`

  2. create Podfile right under your project directory, and its content is: (now it will not work because I haven't sumit to CocoaPods)
    * `pod 'AutoCompleteSuffixView', '0.1'`

  3. run `pod install` on your terminal.

  4. open ${projectname}.xcworkspace from now on，do not open ${projectname}.xcodeproj anymore.

# Usage
1. import header file: `import "AutoCompleteSuffixView.h"`

2. Sample usage:

    `NSArray *suffixs = @[@"163.com", @"qq.com", @"126.com", @"vip.188.com"];`
    `AutoCompleteSuffixView *autoBindUrs = [[AutoCompleteSuffixView alloc] initWithInputField:self.ursTextField suffixs:suffixs];`
    `[self.view addSubview:autoBindUrs];`

    * tips：self.ursTextField(UITextField) is the UITextField that you want to bind AutoCompleteSuffixView to, and `suffixs` is the completion suffixs array.

3. Memo：AutoCompleteSuffixExample's Xcode project can only run in Xcode 5+

# ScreenShot
![screenshot]()
