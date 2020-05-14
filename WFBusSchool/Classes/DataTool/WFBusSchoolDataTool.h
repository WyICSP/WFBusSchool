//
//  WFBusSchoolDataTool.h
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/9.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class WFBusSchoolFileListModel;
@class WFUserCenterModel;
@class WFMineCustomerServicModel;

@interface WFBusSchoolDataTool : NSObject

/// 获取文件和数据
/// @param params 参数
/// @param resultBlock 返回结果
+ (void)getBusSchoolFileWithParams:(NSDictionary *)params
                       resultBlock:(void(^)(NSArray <WFBusSchoolFileListModel *> *models))resultBlock;


/// 获取个人中心数据
/// @param params 参数
/// @param resultBlock 返回
+ (void)getUserInfoWithParams:(NSDictionary *)params
                  resultBlock:(void(^)(WFUserCenterModel *models))resultBlock;



/// 获取客服联系方式
/// @param params 参数
/// @param resultBlock 返回结构
+ (void)getCustomerServiceWithParams:(NSDictionary *)params
                         resultBlock:(void(^)(WFMineCustomerServicModel *cModel))resultBlock;

@end

NS_ASSUME_NONNULL_END
