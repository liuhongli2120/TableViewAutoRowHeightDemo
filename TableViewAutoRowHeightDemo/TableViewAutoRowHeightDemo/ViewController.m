//
//  ViewController.m
//  TableViewAutoRowHeightDemo
//
//  Created by 刘宏立 on 2016/11/19.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import "ViewController.h"
#import "HLAutoHeightCellTableViewCell.h"

static NSString *cellId = @"cellId";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"%zd -- %zd", indexPath.section, indexPath.row);
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    return cell;
}


- (void)setupUI {
    
    UITableView *tv = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tv];
    
    // 设置预估行高,这样太重要
    tv.estimatedRowHeight = 100;
    // 设置自动行高,这一行不要似乎也可以,你值得一试注释
    tv.rowHeight = UITableViewAutomaticDimension;
    
    [tv registerClass:[HLAutoHeightCellTableViewCell class] forCellReuseIdentifier:cellId];
    
    tv.dataSource = self;
    tv.delegate = self;
    
}


@end
