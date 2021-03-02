//
//  ViewController.m
//  MZRadarChart
//
//  Created by Mr.Z on 2020/1/10.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import "ViewController.h"
#import "MZRadarChartView.h"
#import "MZRadarChartConfiguration.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"雷达图表";
    [self setupUI];
}

- (void)setupUI {
    MZRadarChartConfiguration *configuration = [MZRadarChartConfiguration defaultConfiguration];
    MZRadarChartView *radarChartView = [[MZRadarChartView alloc] initWithFrame:CGRectMake(56.0, 200.0, 260.0, 260.0) configuration:configuration];
    [self.view addSubview:radarChartView];
    [radarChartView showDescriptions:@[@"智力", @"力量", @"敏捷", @"健康", @"体质"]];
    [radarChartView showValues:@[@(50.0), @(80.0), @(77.0), @(55.0), @(60.0)] fillColor:[[UIColor greenColor] colorWithAlphaComponent:0.5]];
    [radarChartView showValues:@[@(90.0), @(30.0), @(81.0), @(76.0), @(43.0)] fillColor:[[UIColor blueColor] colorWithAlphaComponent:0.3]];
}

@end
