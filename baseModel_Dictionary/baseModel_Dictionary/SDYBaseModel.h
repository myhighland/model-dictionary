//
//  SDYBaseModel.h
//  baseModel_Dictionary
//
//  Created by Keith on 16/4/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDYBaseModel : NSObject
/**
 *  模型转字典
 *
 *  @return 字典
 */
- (NSDictionary *)dictionaryFromModel;

/**
 *  带model的数组或字典转字典
 *
 *  @param object 带model的数组或字典转
 *
 *  @return 字典
 */
- (id)idFromObject:(nonnull id)object;

@end
