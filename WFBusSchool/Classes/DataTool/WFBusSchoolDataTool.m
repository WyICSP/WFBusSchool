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
    NSString *path = [NSString stringWithFormat:@"%@yzsh-partner-apply/V1/commercial/getCommercialViewAndFile",NEW_HOST_URL];
    [WKRequest getWithURLString:path parameters:params isShowHud:YES success:^(WKBaseModel *baseModel) {
        if (CODE_ZERO) {
            resultBlock([WFBusSchoolFileListModel mj_objectArrayWithKeyValuesArray:baseModel.data]);
        }else {
            [YFToast showMessage:baseModel.message inView:[[YFKeyWindow shareInstance] getCurrentVC].view];
        }
    } failure:^(NSError *error) {
        
    }];
}


@end
