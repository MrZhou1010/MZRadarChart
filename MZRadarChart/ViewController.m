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
    // Do any additional setup after loading the view.
    MZRadarChartConfiguration *configuration = [MZRadarChartConfiguration defaultConfiguration];
    MZRadarChartView *radarChartView = [[MZRadarChartView alloc] initWithFrame:CGRectMake(56, 200, 260, 260) configuration:configuration];
    [self.view addSubview:radarChartView];
    [radarChartView showDescriptions:@[@"智力", @"力量", @"敏捷", @"健康", @"体质"]];
    [radarChartView showValues:@[@(50), @(80), @(77), @(55), @(60)] fillColor:[[UIColor greenColor] colorWithAlphaComponent:0.5]];
    [radarChartView showValues:@[@(90), @(30), @(81), @(76), @(43)] fillColor:[[UIColor blueColor] colorWithAlphaComponent:0.3]];
}

@end
