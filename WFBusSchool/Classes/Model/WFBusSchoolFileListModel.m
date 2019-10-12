//
//  WFBusSchoolFileListModel.m
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/9.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import "WFBusSchoolFileListModel.h"
#import <MJExtension/MJExtension.h>

@implementation WFBusSchoolFileListModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"Id":@"id"};
}

@end
