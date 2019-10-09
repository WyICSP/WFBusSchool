//
//  WFBusSchoolCollectionReusableView.m
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/8.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import "WFBusSchoolCollectionReusableView.h"

@implementation WFBusSchoolCollectionReusableView

static NSString *const rId = @"WFBusSchoolCollectionReusableView";

+ (instancetype)reusableViewWithCollectionView:(UICollectionView *)collevtionView indexPath:(NSIndexPath *)indexPath {
    WFBusSchoolCollectionReusableView *headView = [collevtionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:rId forIndexPath:indexPath];
    if (headView == nil) {
        headView = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFBusSchoolCollectionReusableView" owner:nil options:nil] firstObject];
    }
    return headView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
