//
//  UITableViewCell+Nib.h
//  dfpo
//
//  Created by dfpo on 2016/11/23.
//  Copyright © 2016年 dfpo. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UITableViewCell (SXPodCategory_Add)
+ (instancetype)cellFromTableView:(UITableView *)tableView;

/**
 寻找自身所在的TableView
 */
@property (nonatomic, weak, readonly) UITableView *tableView;

/**
 自身在表中的索引
 */
@property (nonatomic, strong, readonly) NSIndexPath *index_path;
@end
