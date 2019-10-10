//
//  WFBusSchoolViewController.m
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/8.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import "WFBusSchoolViewController.h"
#import "WFBusSchoolCollectionReusableView.h"
#import "WFFirstBusCollectionViewCell.h"
#import "WFSecondBusCollectionViewCell.h"
#import "WFVedioItemCollectionViewCell.h"
#import "WFFileListViewController.h"
#import "WFBusSchoolHistoryModel.h"
#import "WFBusSchoolFileListModel.h"
#import <MJExtension/MJExtension.h>
#import "WFOpenPDFFileViewController.h"
#import "WKHelp.h"

@interface WFBusSchoolViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
/// collectionview
@property (nonatomic, strong, nullable) UICollectionView *collectionView;
/// 历史数据
@property (nonatomic, strong, nullable) NSMutableArray <WFBusSchoolFileListModel *> *histroyArray;
@end

@implementation WFBusSchoolViewController

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //历史数据
    self.histroyArray = [WFBusSchoolFileListModel mj_objectArrayWithKeyValuesArray:[[WFBusSchoolHistoryModel shareInstance] readData]];
    
    [self.collectionView reloadData];
}

#pragma mark 私有方法
- (void)setUI {
    self.title = @"商学院";
}

#pragma mark UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.histroyArray.count == 0 ? 1 : 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return section == 0 ? 2 : self.histroyArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        //顶部 写死的
        WFFirstBusCollectionViewCell *cell = [WFFirstBusCollectionViewCell cellWithCollectionView:collectionView indexPath:indexPath];
        [cell bindCellWithIndexPath:indexPath];
        return cell;
    }else{
        WFBusSchoolFileListModel *itemModle = self.histroyArray[indexPath.row];
        if (itemModle.type == 0) {
            // 视频
            WFVedioItemCollectionViewCell *cell = [WFVedioItemCollectionViewCell cellWithCollectionView:collectionView indexPath:indexPath];
            cell.model = itemModle;
            return cell;
        }
        //文档
        WFSecondBusCollectionViewCell *cell = [WFSecondBusCollectionViewCell cellWithCollectionView:collectionView indexPath:indexPath];
        cell.model = itemModle;
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake((ScreenWidth-40.0f)/2, KHeight(80.0f));
    }
    WFBusSchoolFileListModel *itemModle = self.histroyArray[indexPath.row];
    return CGSizeMake(ScreenWidth, itemModle.type == 1 ? 55.0f : 98.0f);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(ScreenWidth, KHeight(54.0f));
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return section == 0 ? UIEdgeInsetsMake(0, 15.0f, 0, 15.0f) : UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return section == 0 ? 10.0f : CGFLOAT_MIN;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        WFBusSchoolCollectionReusableView *reusableView = [WFBusSchoolCollectionReusableView reusableViewWithCollectionView:collectionView indexPath:indexPath];
        reusableView.title.text = indexPath.section == 0 ? @"常用服务" : @"最近";
        return reusableView;
    }
    return [UICollectionReusableView new];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        WFFileListViewController *file = [[WFFileListViewController alloc] init];
        file.hidesBottomBarWhenPushed = YES;
        file.fileType = indexPath.row == 0 ? WFBusSchoolPSFFileType : WFBusSchoolVedioFileType;
        [self.navigationController pushViewController:file animated:YES];
    }else if (indexPath.section == 1) {
        //查看视频文档
        WFBusSchoolFileListModel *itemModle = self.histroyArray[indexPath.row];
        WFOpenPDFFileViewController *pdfFile = [[WFOpenPDFFileViewController alloc] init];
        pdfFile.title = itemModle.name;
        pdfFile.urlString = itemModle.url;
        pdfFile.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:pdfFile animated:YES];
    }
}

#pragma mark  get set
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.backgroundColor = UIColor.whiteColor;
        [_collectionView registerNib:[UINib nibWithNibName:@"WFFirstBusCollectionViewCell" bundle:[NSBundle bundleForClass:[self class]]] forCellWithReuseIdentifier:@"WFFirstBusCollectionViewCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"WFSecondBusCollectionViewCell" bundle:[NSBundle bundleForClass:[self class]]] forCellWithReuseIdentifier:@"WFSecondBusCollectionViewCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"WFVedioItemCollectionViewCell" bundle:[NSBundle bundleForClass:[self class]]] forCellWithReuseIdentifier:@"WFVedioItemCollectionViewCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"WFBusSchoolCollectionReusableView" bundle:[NSBundle bundleForClass:[self class]]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"WFBusSchoolCollectionReusableView"];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}



@end
