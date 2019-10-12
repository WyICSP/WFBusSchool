//
//  WFBusSchoolHistoryModel.m
//  WFBusSchool_Example
//
//  Created by 王宇 on 2019/10/9.
//  Copyright © 2019 wyxlh. All rights reserved.
//

#import "WFBusSchoolHistoryModel.h"
#import "WKHelp.h"

@interface WFBusSchoolHistoryModel ()
/// 重复数据的下标
@property (nonatomic, assign) NSInteger index;
@end

@implementation WFBusSchoolHistoryModel

+ (instancetype)shareInstance {
    static WFBusSchoolHistoryModel *historyModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        historyModel = [[WFBusSchoolHistoryModel alloc] init];
    });
    return historyModel;
}

/**
 写入数据
 
 @return return value description
 */
#pragma  mark -
- (void)saveData:(NSMutableArray *)searchArray {
    if (searchArray.count == 0) return;
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:[self readData]];
    
    if (![self isIdenticalWithItemArray:searchArray]) {
        //如果没有就直接添加
        [array insertObjects:searchArray atIndexes:[NSIndexSet indexSetWithIndex:0]];
    }else {
        //移除之前的添加最新的
        [array removeObjectAtIndex:self.index];
        [array insertObjects:searchArray atIndexes:[NSIndexSet indexSetWithIndex:0]];
    }

    if (array.count > 10) {
        [array removeLastObject];
    }
    //序列化
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    [YFUserDefaults setObject:jsonStr forKey:@"RecordHistoryArray"];
    [YFUserDefaults synchronize];
}

/**
 读取数据
 
 @param NSMutableArray NSMutableArray description
 @return return value description
 */
#pragma  mark -
- (NSMutableArray *)readData {
    NSString *jsonStr = [NSString stringWithFormat:@"%@",[YFUserDefaults objectForKey:@"RecordHistoryArray"]];
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    if (jsonData == nil ) {
        return [NSMutableArray new];
    }
    //反序列化
    NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    if (!array) {
        array = [[NSMutableArray alloc] init];
    }
    return array;
}

/// 判断是否有相同数据
/// @param itemArray 传入的数据
- (BOOL)isIdenticalWithItemArray:(NSArray *)itemArray {
    NSMutableArray *array = [NSMutableArray arrayWithArray:[self readData]];
    NSMutableArray *IdArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in array) {
        NSString *Id = [NSString stringWithFormat:@"%@",[dict objectForKey:@"Id"]];
        [IdArray addObject:Id];
    }
    
    NSDictionary *itemDic = [itemArray firstObject];
    NSString *itemId = [NSString stringWithFormat:@"%@",[itemDic objectForKey:@"Id"]];
    
    for (int i = 0; i < IdArray.count; i ++) {
        if ([itemId isEqualToString:[IdArray objectAtIndex:i]]) {
            self.index = i;
        }
    }
    if ([IdArray containsObject:itemId] == NO) {
        return NO;
    }
    return YES;
    
}

/**
 删除数据。使用空数据写入替换
 */
- (void)deleteData {
    NSMutableArray *categoryArray = [[NSMutableArray alloc] init];
    [YFUserDefaults setObject:categoryArray forKey:@"RecordHistoryArray"];
    [YFUserDefaults synchronize];
}

@end
