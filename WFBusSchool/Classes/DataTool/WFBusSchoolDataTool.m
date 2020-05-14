//
//  WFBusSchoolDataTool.m
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/9.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import "WFBusSchoolDataTool.h"
#import <MJExtension/MJExtension.h>
#import "WFBusSchoolFileListModel.h"
#import "WFUserCenterModel.h"
#import "SKSafeObject.h"
#import "YFKeyWindow.h"
#import "WKRequest.h"
#import "WKSetting.h"
#import "YFToast.h"
#import "WKHelp.h"

@implementation WFBusSchoolDataTool

+ (void)getBusSchoolFileWithParams:(NSDictionary *)params
                       resultBlock:(void(^)(NSArray <WFBusSchoolFileListModel *> *models))resultBlock {
    //接口地址
    NSString *path = [NSString stringWithFormat:@"%@app-partner/commercialTemplate/getCommercialViewAndFile",NEW_HOST_URL];
    [WKRequest postWithURLString:path parameters:params isJson:YES isShowHud:YES success:^(WKBaseModel *baseModel) {
        if (CODE_ZERO) {
            resultBlock([WFBusSchoolFileListModel mj_objectArrayWithKeyValuesArray:baseModel.data]);
        }else {
            [YFToast showMessage:baseModel.message inView:[[YFKeyWindow shareInstance] getCurrentVC].view];
        }
    } failure:^(NSError *error) {
        
    }];
}

+ (void)getUserInfoWithParams:(NSDictionary *)params
                  resultBlock:(void(^)(WFUserCenterModel *models))resultBlock {
    NSString *path = [NSString stringWithFormat:@"%@app-partner-setmeal/v1/home/pageInfo/getAdminInfo",NEW_HOST_URL];
    [WKRequest getWithURLString:path parameters:nil isShowHud:NO success:^(WKBaseModel *baseModel) {
        if (CODE_ZERO) {
            resultBlock([WFUserCenterModel mj_objectWithKeyValues:baseModel.data]);
        }
    } failure:^(NSError *error) {
        
    }];
}

+ (void)getCustomerServiceWithParams:(NSDictionary *)params
                         resultBlock:(void(^)(WFMineCustomerServicModel *cModel))resultBlock {
    NSString *path = [NSString stringWithFormat:@"%@app-partner-setmeal/v1/home/pageInfo/headAd",NEW_HOST_URL];
    [WKRequest getWithURLString:path parameters:nil isShowHud:NO success:^(WKBaseModel *baseModel) {
        if (CODE_ZERO) {
            resultBlock([WFMineCustomerServicModel mj_objectWithKeyValues:baseModel.data]);
        }
    } failure:^(NSError *error) {
        
    }];
}

@end
