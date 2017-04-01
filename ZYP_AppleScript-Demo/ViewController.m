//
//  ViewController.m
//  ZYP_AppleScript-Demo
//
//  Created by 赵云鹏 on 2017/4/1.
//  Copyright © 2017年 赵云鹏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak) IBOutlet NSTextField *account;
@property (weak) IBOutlet NSTextField *password;
@end

@implementation ViewController

FOUNDATION_EXTERN NSString *const _appstore = @"App Store";
FOUNDATION_EXTERN NSString *const _emptyTheTrash = @"Empty the Trash";


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)login:(NSButton *)sender {
    if ([self.account.stringValue isEqualToString:@""]
        || [self.password.stringValue isEqualToString:@""]) {
        return;
    }
    
    [self getPathAndRunTaskWithName:_appstore array:@[self.account.stringValue,self.password.stringValue]];
}

- (IBAction)emptyTheTrash:(NSButton *)sender {
    [self getPathAndRunTaskWithName:_emptyTheTrash array:@[self.account.stringValue,self.password.stringValue]];
}


- (void)getPathAndRunTaskWithName:(NSString *)string array:(NSArray *)array {
    
    NSString *path = [[NSBundle mainBundle]pathForResource:string ofType:@"scpt"];
    
    NSMutableArray *taskArray = [array mutableCopy];
    [taskArray insertObject:path atIndex:0];
    
    [self runTask:taskArray];
}


- (void)runTask:(NSMutableArray *)array {
    [NSTask launchedTaskWithLaunchPath:@"/usr/bin/osascript" arguments:array];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
