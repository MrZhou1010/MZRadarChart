//
//  MZRadarChartConfiguration.h
//  MZRadarChart
//
//  Created by Mr.Z on 2020/1/10.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MZRadarChartLabelStyle) {
    MZRadarChartLabelStyleHorizontal = 0,   // 水平
    MZRadarChartLabelStyleCircle,           // 圆环
    MZRadarChartLabelStyleHidden,           // 隐藏
};

@interface MZRadarChartConfiguration : NSObject

/// 顶点的个数,默认为5个
@property (nonatomic, assign) NSInteger chartPointCount;
/// 分层的个数,默认为5个
@property (nonatomic, assign) NSInteger chartLayerCount;
/// 最外层轴线的半径,默认为100.0
@property (nonatomic, assign) CGFloat chartMaxRadius;
/// 最外层的值,默认为100.0
@property (nonatomic, assign) CGFloat chartMaxValue;
/// 每层的边线颜色,默认为0.2的blackColor
@property (nonatomic, strong) UIColor *chartLayerBoarderColor;
/// 每层的填充颜色,默认为whiteColor
@property (nonatomic, strong) UIColor *chartLayerFillColor;
/// 轴线的颜色,,默认为0.3的blackColor
@property (nonatomic, strong) UIColor *chartAxisColor;
/// Label的样式,默认水平显示
@property (nonatomic, assign) MZRadarChartLabelStyle labelStyle;
/// Label的文本颜色,默认blackColor
@property (nonatomic, strong) UIColor *descTextColor;
/// Label的文本大小,默认15
@property (nonatomic, strong) UIFont *descTextFont;

/// 单例
+ (instancetype)defaultConfiguration;

@end

NS_ASSUME_NONNULL_END
