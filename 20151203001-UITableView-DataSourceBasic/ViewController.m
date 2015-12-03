//
//  ViewController.m
//  20151203001-UITableView-DataSourceBasic
//
//  Created by Rainer on 15/12/3.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置tableView的数据源代理
    self.tableView.dataSource = self;
    
    self.tableView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0);
}

#pragma mark - UITableView数据源代理方法
/**
 *  返回TableView的分组数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

/**
 *  返回TableView每组有多少行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rowInSection = 10;
    
    if (1 == section) {
        rowInSection = 30;
    }
    
    return rowInSection;
}

/**
 *  返回TableView的每一行
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    NSMutableString *textString = [NSMutableString string];
    
    [textString appendFormat:@"第%d组%d行", indexPath.section, indexPath.row];

    tableViewCell.textLabel.text = textString;
    
    return tableViewCell;
}

/**
 *  返回一个当前组的标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSMutableString *headerTitle = [NSMutableString string];
    
    if (0 == section) {
        [headerTitle appendString:@"看我们第一组好牛逼"];
    } else {
        [headerTitle appendString:@"你牛逼所以你先输出"];
    }
    
    return headerTitle;
}

/**
 *  返回一个当前组的底部描述
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    NSMutableString *footerTitle = [NSMutableString string];
    
    if (0 == section) {
        [footerTitle appendString:@"第二组别他妈拖后腿"];
    } else {
        [footerTitle appendString:@"不敢不敢"];
    }
    
    return footerTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
