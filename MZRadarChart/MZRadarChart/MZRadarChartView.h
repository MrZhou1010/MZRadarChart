//
//  MZRadarChartView.h
//  MZRadarChart
//
//  Created by Mr.Z on 2020/1/10.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MZRadarChartConfiguration;

@interface MZRadarChartView : UIView

/**
 * 初始化
 *
 * @pram frame 布局
 * @pram configuration 配置
 *
 */
- (instancetype)initWithFrame:(CGRect)frame configuration:(MZRadarChartConfiguration *)configuration;

/**
 * 添加配置
 *
 * @pram configuration 配置
 *
 */
- (void)showWithConfiguration:(MZRadarChartConfiguration *)configuration;

/**
 * 添加描述
 *
 * @pram descArr 描述文字
 *
 */
- (void)showDescriptions:(NSArray *)descArr;

/**
 * 绘制数据
 *
 * @pram dataArr 数据
 * @pram fillColor 填充颜色
 *
 */
- (void)showValues:(NSArray *)dataArr fillColor:(UIColor *)fillColor;

@end

NS_ASSUME_NONNULL_END
