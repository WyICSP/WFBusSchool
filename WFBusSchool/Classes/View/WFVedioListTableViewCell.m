//
//  WFVedioListTableViewCell.m
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/9.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import "WFVedioListTableViewCell.h"
#import "WFBusSchoolFileListModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSString+Regular.h"

@implementation WFVedioListTableViewCell

static NSString *const cellId = @"WFVedioListTableViewCell";

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    WFVedioListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFVedioListTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    self.imgView.layer.cornerRadius = 3.0f;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(WFBusSchoolFileListModel *)model {
    //当前文件的 bundle
    NSBundle *currentBundler = [NSBundle bundleForClass:[self class]];
    NSString *defaultImgPath = [NSString getImagePathWithCurrentBundler:currentBundler PhotoName:@"vedioChang" bundlerName:@"WFBusSchool.bundle"];
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageWithContentsOfFile:defaultImgPath]];
    self.title.text = model.name;
    self.time.text = model.time;
}

@end
