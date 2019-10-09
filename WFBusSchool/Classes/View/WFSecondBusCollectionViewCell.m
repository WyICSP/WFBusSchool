//
//  WFSecondBusCollectionViewCell.m
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/8.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import "WFSecondBusCollectionViewCell.h"
#import "WFBusSchoolFileListModel.h"

@implementation WFSecondBusCollectionViewCell

static NSString *const cellId = @"WFSecondBusCollectionViewCell";

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView
                             indexPath:(NSIndexPath *)indexPath {
    WFSecondBusCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFSecondBusCollectionViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(WFBusSchoolFileListModel *)model {
    self.title.text = model.name;
    self.time.text = model.time;
}

@end
