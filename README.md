AutoCompleteSuffixView
======================

# Introduction
AutoCompleteSuffixView helps to complete account's suffix automatically when user type characters in UITextField. For more details, please see the screenshot below.

# Installation
* Normal installation

  * put AutoCompleteSuffixView.h and AutoCompleteSuffixView.m ([here](https://github.com/jianpx/AutoCompleteSuffixView/tree/master/AutoCompleteSuffixExample/AutoCompleteSuffixExample))into your project.

* CocoaPods style installation

  * Install CocoaPods if you do not have it installed.
    * `$[sudo] gem install cocoapods`
    * `$ pod setup`

  * create Podfile right under your project directory, and its content is:
    * `pod 'AutoCompleteSuffixView', '~> 0.3'`

  * run `pod install` on your terminal.
  * open ${projectname}.xcworkspace from now on，do not open ${projectname}.xcodeproj anymore.

# Usage
* import header file: `import "AutoCompleteSuffixView.h"`

* Sample usage:

    `NSArray *suffixs = @[@"163.com", @"qq.com", @"126.com", @"vip.188.com"];`
    `AutoCompleteSuffixView *autoBindUrs = [[AutoCompleteSuffixView alloc] initWithInputField:self.ursTextField suffixs:suffixs];`
    `[self.view addSubview:autoBindUrs];`

    * tips：self.ursTextField(UITextField) is the UITextField that you want to bind AutoCompleteSuffixView to, and `suffixs` is the completion suffixs array.

* Memo：AutoCompleteSuffixExample's Xcode project can only run in Xcode 5+

# ScreenShot
![screenshot](https://github.com/jianpx/AutoCompleteSuffixView/raw/master/autocompletesuffix.gif)
