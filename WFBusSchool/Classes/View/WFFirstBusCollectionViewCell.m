//
//  WFFirstBusCollectionViewCell.m
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/8.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import "WFFirstBusCollectionViewCell.h"
#import "NSString+Regular.h"

@implementation WFFirstBusCollectionViewCell

static NSString *const cellId = @"WFFirstBusCollectionViewCell";

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView
                             indexPath:(NSIndexPath *)indexPath {
    WFFirstBusCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFFirstBusCollectionViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)bindCellWithIndexPath:(NSIndexPath *)indexPath {
    //当前文件的 bundle
    NSBundle *currentBundler = [NSBundle bundleForClass:[self class]];
    if (indexPath.row == 0) {
        [self.itemBtn setTitle:@"文档" forState:0];
        //按钮图片
        NSString *btnImgPath = [NSString getImagePathWithCurrentBundler:currentBundler PhotoName:@"fileImg" bundlerName:@"WFBusSchool.bundle"];
        [self.itemBtn setImage:[UIImage imageWithContentsOfFile:btnImgPath] forState:0];
        //背景图片
        NSString *bgImgPath = [NSString getImagePathWithCurrentBundler:currentBundler PhotoName:@"Filelogo" bundlerName:@"WFBusSchool.bundle"];
        [self.itemBtn setBackgroundImage:[UIImage imageWithContentsOfFile:bgImgPath] forState:0];
    }else {
        [self.itemBtn setTitle:@"视频" forState:0];
        //按钮图片
        NSString *btnImgPath = [NSString getImagePathWithCurrentBundler:currentBundler PhotoName:@"videoImg" bundlerName:@"WFBusSchool.bundle"];
        [self.itemBtn setImage:[UIImage imageWithContentsOfFile:btnImgPath] forState:0];
        //背景图片
        NSString *bgImgPath = [NSString getImagePathWithCurrentBundler:currentBundler PhotoName:@"videologo" bundlerName:@"WFBusSchool.bundle"];
        [self.itemBtn setBackgroundImage:[UIImage imageWithContentsOfFile:bgImgPath] forState:0];
    }
}

@end
