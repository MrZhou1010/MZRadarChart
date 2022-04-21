# MZRadarChart
雷达图表

![image](https://github.com/MrZhou1010/MZRadarChart/blob/master/demo.png)

    MZRadarChartConfiguration *configuration = [MZRadarChartConfiguration defaultConfiguration];
    MZRadarChartView *radarChartView = [[MZRadarChartView alloc] initWithFrame:CGRectMake(56.0, 200.0, 260.0, 260.0) configuration:configuration];
    [self.view addSubview:radarChartView];
    [radarChartView showDescriptions:@[@"智力", @"力量", @"敏捷", @"健康", @"体质"]];
    [radarChartView showValues:@[@(50.0), @(80.0), @(77.0), @(55.0), @(60.0)] fillColor:[[UIColor greenColor] colorWithAlphaComponent:0.5]];
    [radarChartView showValues:@[@(90.0), @(30.0), @(81.0), @(76.0), @(43.0)] fillColor:[[UIColor blueColor] colorWithAlphaComponent:0.3]];
