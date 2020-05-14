//
//  WFSchoolWebViewController.m
//  AFNetworking
//
//  Created by 王宇 on 2020/5/14.
//

#import "WFSchoolWebViewController.h"
#import "WFSchoolJSApi.h"
#import "WKHelp.h"

@interface WFSchoolWebViewController ()

@end

@implementation WFSchoolWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.dwebview addJavascriptObject:[[WFSchoolJSApi alloc] init] namespace:nil];
    self.progressColor = NavColor;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
