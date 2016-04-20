//
//  WebSiteListController.m
//  PasswordManager
//
//  Created by Sariel on 16/4/16.
//  Copyright © 2016年 Sariel. All rights reserved.
//

#import "WebSiteListController.h"
#import "HandleDatas.h"
#import "PWDModel.h"

@interface WebSiteListController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableList;
@property (nonatomic, strong) NSArray *arrDatas;
@end

@implementation WebSiteListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"WebSite List";
    
    // 创建navItem的左右按钮
    [self createLeftAndRightNavigationItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建navItem的左右按钮 (使用系统搜索icon)
- (void) createLeftAndRightNavigationItem {
    // create Left Item
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(tapLeftNavItem)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(tapRightNavItem)];
}

#pragma mark - aciton
- (void) tapLeftNavItem {
    printf("tap left nav item");
}

- (void) tapRightNavItem {
    _arrDatas = nil;
    [self.tableList reloadData];
}

#pragma mark - UITableViewDelegate, UITableViewDatasource
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    // 绑定内容
    PWDModel *model = self.arrDatas[indexPath.row];
    cell.textLabel.text = model.webSite;
    cell.detailTextLabel.text = model.accountName;
    
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrDatas.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

#pragma mark - Getter and Setter
- (UITableView *)tableList {
    if (nil == _tableList) {
        _tableList = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableList.delegate = self;
        _tableList.dataSource = self;
        [self.view addSubview:_tableList];
    }
    return _tableList;
}

- (NSArray *)arrDatas {
    if (nil == _arrDatas) {
        _arrDatas = [HandleDatas getAllDatas];
    }
    return _arrDatas;
}


@end
