//
//  WFOpenPDFFileViewController.h
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/9.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import <WFKitMain/YFBaseViewController.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFOpenPDFFileViewController : YFBaseViewController
/**
 webView
 */
@property (nonatomic, strong) WKWebView *webView;
/**
 网址链接
 */
@property (nonatomic, copy) NSString  *urlString;
/**
 进度条颜色 默认为橙色
 */
@property (nonatomic, strong) UIColor   *progressColor;
@end

NS_ASSUME_NONNULL_END
