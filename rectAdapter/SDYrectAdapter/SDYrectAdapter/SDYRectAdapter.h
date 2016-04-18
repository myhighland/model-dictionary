//
//  SDYRectAdapter.h
//  SDYrectAdapter
//
//  Created by Keith on 16/4/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CGRectAdapter : NSObject
//适配subBaseViewController的view的Rect
+(CGRect)subViewControllerRectMack:(CGRect)rect;
//适配subBaseView的Rect
+(CGRect)subViewRectMack:(CGRect)rect;
//适配宽度
+(CGRect)widthRectMack:(CGRect)rect;
//适配高度
+(CGRect)adaptRectForHeight:(CGRect)rect;
//适配高度和宽度且居中(center点不变)
+(CGRect)widthAndheightRectMack:(CGRect)rect;
//适配高度和宽度(扩大两倍,左上顶点不变)
+(CGRect)doubleWidthAndHeightRectMack:(CGRect)rect;
//宽度和高度扩大指定的倍数
+(CGRect)expandWidthAndHeightByIphoneRate:(double)iphoneRate andIpadRate:(double)ipadRate withRect:(CGRect)rect;

//仅仅高度宽度变化，x.y 不变
+(CGRect)XYRectMack:(CGRect)rect;
//适配在父视图的x，y坐标

//适配高度和y坐标(扩大两倍)
+(CGRect)heightAndYRectMack:(CGRect)rect;
//适配高度和y坐标(扩大指定倍数)
+(CGRect)heightAndYRectMack:(CGRect)rect withIphoneScale:(double)iphoneScale andIpadScale:(double)ipadScale;
//适配y、宽度和高度(扩大两倍)
+(CGRect)yWidthAndHeight:(CGRect)rect;
//适配x、y和高度
+(CGRect)xyAndHeight:(CGRect)rect;
//适配x、宽度和高度（扩大两倍）
+(CGRect)xWidthAndHeight:(CGRect)rect;
//适配高度、宽度、x、y(扩大两倍)
+(CGRect)XYWidthHeightRectMack:(CGRect)rect;
//适配高度、宽度、x、y并且在x方向上平移x的距离
+(CGRect)XYWidthHeightRectMack:(CGRect)rect offsetX:(CGFloat)offsetX;
//适配x，宽度
+(CGRect)XAndWidthRectMack:(CGRect)rect;
//根据设备放大
+(CGFloat)multiplyScale;
//只对ipad放大
+(CGFloat)multiplyScaleForIpad;
//只对iPad设备扩大比例2倍
+(CGFloat)scaleForiPadWithValue:(CGFloat)value;
//ipad 扩大制定倍数，其他的还是按照常规扩大
+ (CGFloat)multiplyScaleWithFloat:(CGFloat)scale;
//特定设备扩大特定的比例
+(CGFloat)value:(CGFloat)value forIphoneScale:(CGFloat)iphoneScale forIpadScale:(CGFloat)ipadScale;
//特定设备扩大特定比例
+(CGRect)XYWidthHeightRectMack:(CGRect)rect forIphoneScale:(CGFloat)iphoneScale forIpadScale:(CGFloat)ipadScale;
//返回指定的数值
+(CGFloat)indicatorValueForIphone:(CGFloat)iphoneValue andIpad:(CGFloat)ipadValue;
@end
