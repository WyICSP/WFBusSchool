//
//  WFBusSchoolFileListModel.h
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/9.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFBusSchoolFileListModel : NSObject
/// 时间
@property (nonatomic, copy) NSString *time;
/// 文件名
@property (nonatomic, copy) NSString *name;
/// url
@property (nonatomic, copy) NSString *url;
/// 图片
@property (nonatomic, copy) NSString *image;
/// 类型 1 pdf 0 视频
@property (nonatomic, assign) NSInteger type;
@end

NS_ASSUME_NONNULL_END
