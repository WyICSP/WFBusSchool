//
//  WFFileListTableViewCell.h
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/9.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WFBusSchoolFileListModel;

@interface WFFileListTableViewCell : UITableViewCell
/// title
@property (weak, nonatomic) IBOutlet UILabel *title;
/// 时间
@property (weak, nonatomic) IBOutlet UILabel *time;
/// 文件大小
@property (weak, nonatomic) IBOutlet UILabel *fileSize;
///赋值
@property (nonatomic, strong) WFBusSchoolFileListModel *model;
/**初始化*/
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
