//
//  WFFileListTableViewCell.m
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/9.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import "WFFileListTableViewCell.h"
#import "WFBusSchoolFileListModel.h"

@implementation WFFileListTableViewCell

static NSString *const cellId = @"WFFileListTableViewCell";

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    WFFileListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFFileListTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(WFBusSchoolFileListModel *)model {
    self.title.text = model.name;
    self.time.text = model.time;
}

@end
