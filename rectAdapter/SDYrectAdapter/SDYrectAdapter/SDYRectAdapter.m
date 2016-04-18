//
//  SDYRectAdapter.m
//  SDYrectAdapter
//
//  Created by Keith on 16/4/18.
//  Copyright © 2016年 apple. All rights reserved.
//


#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENSTATUSBAR 20
#define SCREENSTABBAR 49
#define SCREENTCONTENTHEIGHT (SCREENHEIGHT-SCREENSTATUSBAR)
#define SCREENTCONTENTWIDTH SCREENWIDTH
#define FIT_PADDING                 ((ISGREATERTHANIOS7) ? 20 : 0)
#define FIT_SCREENTCONTENTHEIGHT    SCREENTCONTENTHEIGHT+FIT_PADDING

#define IPHONE4 ([UIScreen mainScreen].bounds.size.height == 480 ? 1 : 0)
#define IPHONE5 ([UIScreen mainScreen].bounds.size.height == 568 ? 1 : 0)
#define IPHONE6 ([UIScreen mainScreen].bounds.size.height == 667 ? 1 : 0)
#define IPHONE6PLUS ([UIScreen mainScreen].bounds.size.height == 736 ? 1 : 0)
#define ISGREATERTHANIOS6 ([[[UIDevice currentDevice] systemVersion] floatValue]>=6.0)
#define ISGREATERTHANIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0)
#define ISGREATERTHANIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)
#define ISGREATERTHANIOS9 ([[[UIDevice currentDevice] systemVersion] floatValue]>=9.0)
#define IPAD ([UIScreen mainScreen].bounds.size.width >= 768 ? 1 : 0)


#import "SDYRectAdapter.h"

//static const float kScaleForiPhone5 = 1;
//static const float kScaleForiPadWidth = 2.4;
static const float kScaleForiPadHeight = 1.8;
static const float kScaleForiPhone6 = 1.17;
static const float kScaleForiPhone6Plus = 1.29;

@implementation CGRectAdapter
+(CGRect)subViewControllerRectMack:(CGRect)rect{
    return rect;
}

+(CGRect)subViewRectMack:(CGRect)rect{
    return rect;
}

+(CGRect)widthRectMack:(CGRect)rect {
    if (IPAD) {
        return rect;
    }else
        return rect;
}

+(CGRect)adaptRectForHeight:(CGRect)rect {
    if (IPAD) {
        return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height * kScaleForiPadHeight);
    } else if (IPHONE6) {
        return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height * kScaleForiPhone6);
    } else if (IPHONE6PLUS) {
        return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height * kScaleForiPhone6Plus);
    } else {
        return rect;
    }
    return rect;
}

+(CGRect)doubleWidthAndHeightRectMack:(CGRect)rect {
    
    double width = rect.size.width * [self multiplyScale];
    double height = rect.size.height * [self multiplyScale];
    return CGRectMake(rect.origin.x, rect.origin.y, width, height);
    
    
}
+(CGRect)expandWidthAndHeightByIphoneRate:(double)iphoneRate andIpadRate:(double)ipadRate withRect:(CGRect)rect{
    if (IPAD) {
        double width = rect.size.width;
        double height = rect.size.height;
        width *= ipadRate;
        height *= ipadRate;
        return CGRectMake(rect.origin.x, rect.origin.y, width, height);
    }else {
        double width = rect.size.width;
        double height = rect.size.height;
        width *= iphoneRate;
        height *= iphoneRate;
        return CGRectMake(rect.origin.x, rect.origin.y, width, height);
    }
}

+(CGRect)widthAndheightRectMack:(CGRect)rect {
    
    double width = rect.size.width;
    double height = rect.size.height;
    double x = rect.origin.x;
    double y = rect.origin.y;
    
    x -= width / [self multiplyScale];
    y -= height / [self multiplyScale];
    width *= [self multiplyScale];
    height *= [self multiplyScale];
    
    return CGRectMake(x, y, width, height);
    
}

+(CGRect)widthAndHeight:(CGRect)rect{
    double width = rect.size.width;
    double height = rect.size.height;
    double x = rect.origin.x;
    double y = rect.origin.y;
    
    x -= width / [self multiplyScale];
    y -= height / [self multiplyScale];
    width *= [self multiplyScale];
    height *= [self multiplyScale];
    
    return CGRectMake(x, y, width, height);
}

+(CGRect)XYRectMack:(CGRect)rect{
    double x = rect.origin.x;
    double y = rect.origin.y;
    double width = rect.size.width*[self multiplyScale];
    double height = rect.size.height*[self multiplyScale];
    return CGRectMake(x, y, width, height);
}

+(CGRect)heightAndYRectMack:(CGRect)rect{
    double height = rect.size.height *[self multiplyScale];
    double y = rect.origin.y *[self multiplyScale];
    return CGRectMake(rect.origin.x, y, rect.size.width, height);
}

+(CGRect)heightAndYRectMack:(CGRect)rect withIphoneScale:(double)iphoneScale andIpadScale:(double)ipadScale {
    if (IPAD) {
        double height = rect.size.height * ipadScale;
        double y = rect.origin.y * ipadScale;
        
        return CGRectMake(rect.origin.x, y, rect.size.width, height);
    }
    double height = rect.size.height * iphoneScale;
    double y = rect.origin.y * iphoneScale;
    
    return CGRectMake(rect.origin.x, y, rect.size.width, height);
}
+(CGRect)yWidthAndHeight:(CGRect)rect {
    
    double y = rect.origin.y *[self multiplyScale];
    double width = rect.size.width *[self multiplyScale];
    double height = rect.size.height *[self multiplyScale];
    
    return CGRectMake(rect.origin.x, y, width, height);
    
    
}

+(CGRect)xWidthAndHeight:(CGRect)rect {
    
    double x = rect.origin.x *[self multiplyScale];
    double width = rect.size.width *[self multiplyScale];
    double height = rect.size.height *[self multiplyScale];
    
    return CGRectMake(x, rect.origin.y, width, height);
    
}

+(CGRect)xyAndHeight:(CGRect)rect {
    double x = rect.origin.x *[self multiplyScale];
    double y = rect.origin.y * [self multiplyScale];
    double height = rect.size.height *[self multiplyScale];
    
    return CGRectMake(x, y, rect.size.width, height);
}

+(CGRect)XYWidthHeightRectMack:(CGRect)rect{
    
    double x = rect.origin.x * [self multiplyScale];
    double y = rect.origin.y * [self multiplyScale];
    double width = rect.size.width * [self multiplyScale];
    double height = rect.size.height * [self multiplyScale];
    
    return CGRectMake(x, y, width, height);
    
}

+(CGRect)XYWidthHeightRectMack:(CGRect)rect offsetX:(CGFloat)offsetX{
    if (IPAD) {
        double x = rect.origin.x * 2 + offsetX;
        double y = rect.origin.y * 2;
        double width = rect.size.width * 2;
        double height = rect.size.height * 2;
        
        return CGRectMake(x, y, width, height);
    }else if (IPHONE6) {
        double x = rect.origin.x * 1.17 ;
        double y = rect.origin.y * 1.17;
        double width = rect.size.width * 1.17;
        double height = rect.size.height * 1.17;
        return CGRectMake(x, y, width, height);
    }else if(IPHONE6PLUS){
        double x = rect.origin.x * 1.29 ;
        double y = rect.origin.y * 1.29;
        double width = rect.size.width * 1.29;
        double height = rect.size.height * 1.29;
        return CGRectMake(x, y, width, height);
    }
    return rect;
}

//适配x，宽度
+(CGRect)XAndWidthRectMack:(CGRect)rect {
    double x = rect.origin.x * [self multiplyScale];
    double width = rect.size.width * [self multiplyScale];
    return CGRectMake(x, rect.origin.y, width, rect.size.height);
}

+(CGFloat)multiplyScale {
    if (IPAD) {
        return 2.0f;
    } else if (IPHONE6) {
        return kScaleForiPhone6;
    } else if (IPHONE6PLUS) {
        return kScaleForiPhone6Plus;
    }
    return 1.0f;
}

+(CGFloat)multiplyScaleForIpad {
    if (IPAD) {
        return 2.0f;
    }
    return 1.0f;
}

+(CGFloat)scaleForiPadWithValue:(CGFloat)value {
    if (IPAD) {
        return value * 2.0f;
    }
    return value;
}

+ (CGFloat)multiplyScaleWithFloat:(CGFloat)scale{
    if (IPAD) {
        return  scale;
    } else if (IPHONE6) {
        return kScaleForiPhone6;
    } else if (IPHONE6PLUS) {
        return kScaleForiPhone6Plus;
    }
    return 1.0f;
}

+(CGFloat)value:(CGFloat)value forIphoneScale:(CGFloat)iphoneScale forIpadScale:(CGFloat)ipadScale{
    if (IPAD) {
        return value*ipadScale;
    }else if(IPHONE6){
        return value*kScaleForiPhone6;
    }else if(IPHONE6PLUS){
        return value*kScaleForiPhone6Plus;
    }
    return value*iphoneScale;
}

+(CGRect)XYWidthHeightRectMack:(CGRect)rect forIphoneScale:(CGFloat)iphoneScale forIpadScale:(CGFloat)ipadScale {
    if (IPAD) {
        double x = rect.origin.x * ipadScale;
        double y = rect.origin.y * ipadScale;
        double width = rect.size.width * ipadScale;
        double height = rect.size.height * ipadScale;
        
        return CGRectMake(x, y, width, height);
    }
    double x = rect.origin.x * iphoneScale;
    double y = rect.origin.y * iphoneScale;
    double width = rect.size.width * iphoneScale;
    double height = rect.size.height * iphoneScale;
    
    return CGRectMake(x, y, width, height);
}
+(CGFloat)indicatorValueForIphone:(CGFloat)iphoneValue andIpad:(CGFloat)ipadValue {
    if (IPAD) {
        return ipadValue;
    }
    return iphoneValue*[CGRectAdapter multiplyScale];
}
@end
