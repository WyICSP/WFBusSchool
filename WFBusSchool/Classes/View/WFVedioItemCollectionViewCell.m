//
//  WFVedioItemCollectionViewCell.m
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/9.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import "WFVedioItemCollectionViewCell.h"
#import "WFBusSchoolFileListModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSString+Regular.h"

@implementation WFVedioItemCollectionViewCell

static NSString *const cellId = @"WFVedioItemCollectionViewCell";

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView
                             indexPath:(NSIndexPath *)indexPath {
    WFVedioItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFVedioItemCollectionViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imgView.layer.cornerRadius = 3.0f;
}

- (void)setModel:(WFBusSchoolFileListModel *)model {
    //当前文件的 bundle
    NSBundle *currentBundler = [NSBundle bundleForClass:[self class]];
    NSString *btnImgPath = [NSString getImagePathWithCurrentBundler:currentBundler PhotoName:@"fileImg" bundlerName:@"WFBusSchool.bundle"];
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageWithContentsOfFile:btnImgPath]];
    self.title.text = model.name;
    self.time.text = model.name;
}

@end
