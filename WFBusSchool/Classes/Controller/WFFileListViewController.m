//
//  WFFileListViewController.m
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/9.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import "WFFileListViewController.h"
#import "WFFileListTableViewCell.h"
#import "WFVedioListTableViewCell.h"
#import "WFOpenPDFFileViewController.h"
#import "WFBusSchoolDataTool.h"
#import "WFBusSchoolFileListModel.h"
#import "WFBusSchoolHistoryModel.h"
#import "NSString+Regular.h"
#import "SKSafeObject.h"
#import "WKHelp.h"

@interface WFFileListViewController ()<UITableViewDelegate,UITableViewDataSource>
/// tableView
@property (nonatomic, strong, nullable) UITableView *tableView;
/// 数据源
@property (nonatomic, strong, nullable) NSArray <WFBusSchoolFileListModel *> *models;
@end

@implementation WFFileListViewController

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

#pragma mark 私有方法
- (void)setUI {
    self.title = @"文档";
    [self getFileData];
}

- (void)getFileData {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params safeSetObject:self.fileType == WFBusSchoolPSFFileType ? @"1" : @"0" forKey:@"type"];
    @weakify(self)
    [WFBusSchoolDataTool getBusSchoolFileWithParams:params resultBlock:^(NSArray<WFBusSchoolFileListModel *> * _Nonnull models) {
        @strongify(self)
        self.models = models;
        [self.tableView reloadData];
    }];
}

#pragma mark UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.fileType == WFBusSchoolPSFFileType) {
        WFFileListTableViewCell *cell = [WFFileListTableViewCell cellWithTableView:tableView];
        cell.model = self.models[indexPath.row];
        return cell;
    }
    WFVedioListTableViewCell *cell = [WFVedioListTableViewCell cellWithTableView:tableView];
    cell.model = self.models[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WFBusSchoolFileListModel *model = self.models[indexPath.row];
    //得到存储数据
    [[WFBusSchoolHistoryModel shareInstance] saveData:[self itemArrayWithModel:model]];
    //页面跳转
    WFOpenPDFFileViewController *pdfFile = [[WFOpenPDFFileViewController alloc] init];
    pdfFile.title = model.name;
    pdfFile.urlString = model.url;
    [self.navigationController pushViewController:pdfFile animated:YES];
}

- (NSMutableArray *)itemArrayWithModel:(WFBusSchoolFileListModel *)model {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict safeSetObject:[NSString getCurrentDate:[NSDate date]] forKey:@"time"];
    [dict safeSetObject:model.name forKey:@"name"];
    [dict safeSetObject:model.url forKey:@"url"];
    [dict safeSetObject:model.image forKey:@"image"];
    [dict safeSetObject:@(model.type) forKey:@"type"];
    [array addObject:dict];
    return array;
}

#pragma mark get set
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = 0;
        _tableView.rowHeight = self.fileType == WFBusSchoolPSFFileType ? 55.0f : 72.0f;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
