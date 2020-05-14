//
//  WFQusCollectionViewCell.m
//  AFNetworking
//
//  Created by 王宇 on 2020/5/14.
//

#import "WFQusCollectionViewCell.h"

@implementation WFQusCollectionViewCell

static NSString *const cellId = @"WFQusCollectionViewCell";

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView
                             indexPath:(NSIndexPath *)indexPath {
    WFQusCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFQusCollectionViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
