//
//  WFVedioItemCollectionViewCell.h
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/9.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WFBusSchoolFileListModel;

@interface WFVedioItemCollectionViewCell : UICollectionViewCell
///图片
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
///名字
@property (weak, nonatomic) IBOutlet UILabel *title;
/// 时间
@property (weak, nonatomic) IBOutlet UILabel *time;
///赋值
@property (nonatomic, strong) WFBusSchoolFileListModel *model;
/**初始化方法*/
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView
                             indexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
