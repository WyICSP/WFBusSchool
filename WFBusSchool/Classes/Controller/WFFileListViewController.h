//
//  WFFileListViewController.h
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/9.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import <WFKitMain/YFBaseViewController.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, WFBusSchoolFileListType) {
    WFBusSchoolPSFFileType = 0, //pdf 文件
    WFBusSchoolVedioFileType // 视频文件
};

@interface WFFileListViewController : YFBaseViewController
///类型
@property (nonatomic, assign) WFBusSchoolFileListType fileType;
@end

NS_ASSUME_NONNULL_END
