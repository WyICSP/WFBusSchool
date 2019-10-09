//
//  WFFirstBusCollectionViewCell.h
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/8.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFFirstBusCollectionViewCell : UICollectionViewCell
/**item 按钮*/
@property (weak, nonatomic) IBOutlet UIButton *itemBtn;
/**初始化方法*/
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView
                             indexPath:(NSIndexPath *)indexPath;
/// 绑定 cell
/// @param indexPath indexPath
- (void)bindCellWithIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
