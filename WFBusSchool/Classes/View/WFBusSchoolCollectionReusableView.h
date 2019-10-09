//
//  WFBusSchoolCollectionReusableView.h
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/8.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFBusSchoolCollectionReusableView : UICollectionReusableView
/**title*/
@property (weak, nonatomic) IBOutlet UILabel *title;
/**初始化*/
+ (instancetype)reusableViewWithCollectionView:(UICollectionView *)collevtionView indexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
