//
//  SDYsections.h
//  sectionsForTable
//
//  Created by Keith on 16/4/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SDYSection, SDYRow;

@interface SDYsections : NSObject
@property (strong, readonly, nonatomic) NSMutableArray<SDYSection *> *sections;

- (SDYRow *)rowWithIndexPath:(NSIndexPath *)indexPath;                                       /**< 未找到:若section存在，返回rowKey = -99999的row对象，否则返回nil */
- (SDYSection *)sectionWithIndexPathSection:(NSInteger)section;                              /**< 未找到:返回nil */
- (NSIndexPath *)indexPathWithRowKey:(NSInteger)rowKey;                                     /**< 如果rowKey没有重复的，推荐用此方法,未找到返回nil */
- (NSIndexPath *)indexPathWithSectionKey:(NSInteger)sectionKey rowKey:(NSInteger)rowKey;    /**< 如果rowKey有重复的，推荐用此方法,未找到返回nil */
- (NSInteger)indexPathSectionWithSectionKey:(NSInteger)sectionKey;                          /**< 未找到返回-1 */

- (SDYSection *)sectionWithSectionKey:(NSInteger)sectionKey;                                 /**< 未找到返回nil */

- (void)addSection:(SDYSection *)section;                                                    /**< 添加section */
- (void)addSectionKey:(NSInteger)sectionKey rowKey:(NSInteger)rowKey;                       /**< 添加section，推荐使用本方法 */

@end

@class SDYRow;
@interface SDYSection : NSObject

@property (assign, readonly, nonatomic) NSInteger sectionKey;
@property (strong, readonly, nonatomic) NSMutableArray<SDYRow *> *rows;

- (instancetype)initWithSectionKey:(NSInteger)sectionKey;
- (void)addRowKey:(NSInteger)rowKey;
- (SDYRow *)rowAtIndexPathRow:(NSInteger)row;                /**< 未找到返回nil */
- (NSInteger)rowKeyAtIndexPathRow:(NSInteger)row;           /**< 未找到返回-1 */

@end

@interface SDYRow : NSObject

@property (assign, nonatomic) NSInteger sectionKey;
@property (assign, nonatomic) NSInteger rowKey;


@end
