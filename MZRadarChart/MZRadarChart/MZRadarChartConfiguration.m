//
//  MZRadarChartConfiguration.m
//  MZRadarChart
//
//  Created by Mr.Z on 2020/1/10.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import "MZRadarChartConfiguration.h"

@implementation MZRadarChartConfiguration

- (instancetype)init {
    if (self = [super init]) {
        self.chartPointCount = 5;
        self.chartLayerCount = 5;
        self.chartMaxRadius = 100.0;
        self.chartMaxValue = 100.0;
        self.chartLayerBoarderColor = [UIColor colorWithWhite:0.0 alpha:0.2];
        self.chartLayerFillColor = [UIColor whiteColor];
        self.chartAxisColor = [UIColor colorWithWhite:0.0 alpha:0.3];
        self.labelStyle = MZRadarChartLabelStyleHorizontal;
        self.descTextColor = [UIColor blackColor];
        self.descTextFont = [UIFont systemFontOfSize:15];
    }
    return self;
}

+ (instancetype)defaultConfiguration {
    static MZRadarChartConfiguration *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

@end
