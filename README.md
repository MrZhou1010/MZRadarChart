# MZRadarChart
雷达图表

![image](https://github.com/MrZhou1010/MZRadarChart/blob/master/demo.png)

    MZRadarChartConfiguration *configuration = [MZRadarChartConfiguration defaultConfiguration];
    MZRadarChartView *radarChartView = [[MZRadarChartView alloc] initWithFrame:CGRectMake(56, 200, 260, 260) configuration:configuration];
    [self.view addSubview:radarChartView];
    [radarChartView showDescriptions:@[@"智力", @"力量", @"敏捷", @"健康", @"体质"]];
    [radarChartView showValues:@[@(50), @(80), @(77), @(55), @(60)] fillColor:[[UIColor greenColor] colorWithAlphaComponent:0.5]];
    [radarChartView showValues:@[@(90), @(30), @(81), @(76), @(43)] fillColor:[[UIColor blueColor] colorWithAlphaComponent:0.3]];
