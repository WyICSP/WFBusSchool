//
//  WFBusSchoolHistoryModel.h
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/9.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFBusSchoolHistoryModel : NSObject

/**实例化*/
+ (instancetype)shareInstance;

/**
 *  保存数据
 *
 */
- (void)saveData:(NSMutableArray *)searchArray;

/**
 *  读取数据
 *
 */
- (NSMutableArray *)readData;

/**
 *
 *   删除数据
 */
- (void)deleteData;

@end

NS_ASSUME_NONNULL_END
