//
//  WFSchoolJSApi.m
//  AFNetworking
//
//  Created by 王宇 on 2020/5/14.
//

#import "WFSchoolJSApi.h"
#import "YFKeyWindow.h"
#import "dsbridge.h"

@implementation WFSchoolJSApi

/**返回*/
- (void)goBack:(NSString *)msg :(JSCallback) completionHandler
{
    [[[YFKeyWindow shareInstance] getCurrentVC].navigationController popViewControllerAnimated:YES];
    completionHandler(msg,YES);
    
}

@end
