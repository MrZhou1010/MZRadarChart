//
//  MZRadarChartView.m
//  MZRadarChart
//
//  Created by Mr.Z on 2020/1/10.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import "MZRadarChartView.h"
#import "MZRadarChartConfiguration.h"

@interface MZRadarChartView ()

/// 配置
@property (nonatomic, strong) MZRadarChartConfiguration *configuration;
/// 中心点
@property (nonatomic, assign) CGPoint centerPoint;
/// 轴线之间的角
@property (nonatomic, assign) CGFloat angle;

@end

@implementation MZRadarChartView

#pragma mark - 初始化
- (instancetype)init {
    if (self = [super init]) {
        //
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame configuration:(MZRadarChartConfiguration *)configuration {
    if (self = [super initWithFrame:frame]) {
        self.configuration = configuration;
        [self drawBaseRadarChart];
    }
    return self;
}

- (void)showWithConfiguration:(MZRadarChartConfiguration *)configuration {
    if (!self.configuration) {
        self.configuration = configuration;
        [self drawBaseRadarChart];
    }
}

- (void)drawBaseRadarChart {
    if (self.configuration.chartPointCount < 3 || self.configuration.chartLayerCount < 1) {
        return;
    }
    self.centerPoint = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    self.angle = M_PI * 2.0 / self.configuration.chartPointCount;
    [self drawGridLine];
    [self drawAxisLine];
}

- (void)drawGridLine {
    // 从外向内绘制,避免外层覆盖内层
    for (NSInteger i = self.configuration.chartLayerCount; i > 0; i--) {
        CGFloat radius = self.configuration.chartMaxRadius * i / self.configuration.chartLayerCount;
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPath];
        for (NSInteger j = 0; j < self.configuration.chartPointCount; j++) {
            CGFloat x = radius * sinf(self.angle * j);
            CGFloat y = radius * cosf(self.angle * j);
            CGPoint point = CGPointMake(self.centerPoint.x + x, self.centerPoint.y - y);
            if (j == 0) {
                [path moveToPoint:point];
            } else {
                [path addLineToPoint:point];
            }
        }
        [path closePath];
        shapeLayer.path = path.CGPath;
        shapeLayer.fillColor = self.configuration.chartLayerFillColor.CGColor;
        shapeLayer.strokeColor = self.configuration.chartLayerBoarderColor.CGColor;
        shapeLayer.lineWidth = 1.0 / UIScreen.mainScreen.scale;
        [self.layer addSublayer:shapeLayer];
    }
}

- (void)drawAxisLine {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (NSInteger index = 0; index < self.configuration.chartPointCount; index++) {
        CGFloat x = self.configuration.chartMaxRadius * sinf(self.angle * index);
        CGFloat y = self.configuration.chartMaxRadius * cosf(self.angle * index);
        CGPoint point = CGPointMake(self.centerPoint.x + x, self.centerPoint.y - y);
        [path moveToPoint:self.centerPoint];
        [path addLineToPoint:point];
    }
    [path closePath];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = self.configuration.chartAxisColor.CGColor;
    shapeLayer.lineWidth = 1.0 / UIScreen.mainScreen.scale;
    [self.layer addSublayer:shapeLayer];
}

#pragma mark - 方法
- (void)showValues:(NSArray *)dataArr fillColor:(UIColor *)fillColor {
    if (dataArr.count != self.configuration.chartPointCount) {
        return;
    }
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (NSInteger index = 0; index < self.configuration.chartPointCount; index++) {
        CGFloat value = [dataArr[index] floatValue];
        CGFloat radius = self.configuration.chartMaxRadius * value / self.configuration.chartMaxValue;
        CGFloat x = radius * sinf(self.angle * index);
        CGFloat y = radius * cosf(self.angle * index);
        CGPoint point = CGPointMake(self.centerPoint.x + x, self.centerPoint.y - y);
        if (index == 0) {
            [path moveToPoint:point];
        } else {
            [path addLineToPoint:point];
        }
    }
    [path closePath];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = fillColor.CGColor;
    shapeLayer.strokeColor = self.configuration.chartLayerBoarderColor.CGColor;
    shapeLayer.lineWidth = 1.0 / UIScreen.mainScreen.scale;
    [self.layer addSublayer:shapeLayer];
}

- (void)showDescriptions:(NSArray *)descArr {
    if (descArr.count != self.configuration.chartPointCount) {
        return;
    }
    NSInteger index = 0;
    for (NSString *desc in descArr) {
        CGSize descSize = [self sizeWithDescription:desc maxSize:CGSizeMake(100.0, 20.0)];
        CGFloat x = (self.configuration.chartMaxRadius + descSize.width * 0.5 + 4.0) * sinf(self.angle * index);
        CGFloat y = (self.configuration.chartMaxRadius + descSize.height * 0.5 + 4.0) * cosf(self.angle * index);
        UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, descSize.width, descSize.height)];
        descLabel.center = CGPointMake(self.centerPoint.x + x, self.centerPoint.y - y);
        descLabel.text = desc;
        descLabel.textColor = self.configuration.descTextColor;
        descLabel.font = self.configuration.descTextFont;
        descLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:descLabel];
        switch (self.configuration.labelStyle) {
            case MZRadarChartLabelStyleHorizontal:
                break;
            case MZRadarChartLabelStyleCircle:
                descLabel.transform = CGAffineTransformMakeRotation(self.angle * index);
                break;
            case MZRadarChartLabelStyleHidden:
                descLabel.hidden = YES;
            default:
                break;
        }
        index++;
    }
}

- (CGSize)sizeWithDescription:(NSString *)desc maxSize:(CGSize)maxSize {
    CGRect rect = [desc boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.configuration.descTextFont} context:nil];
    return rect.size;
}

@end
