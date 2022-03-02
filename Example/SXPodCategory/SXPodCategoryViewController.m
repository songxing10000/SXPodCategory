//
//  SXPodCategoryViewController.m
//  SXPodCategory
//
//  Created by dfpo on 05/18/2017.
//  Copyright (c) 2017 dfpo. All rights reserved.
//

#import "SXPodCategoryViewController.h"
#import <SXPodCategory/SXBaseModel.h>
@interface Person:NSObject
@property(nonatomic, copy) NSString *name;
@end
@interface SXPodCategoryViewController ()

@end

@implementation SXPodCategoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"%@ %@", NSStringFromSelector(_cmd),  [SXBaseModel new]);
}


@end
