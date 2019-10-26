//
//  ViewController.m
//  CABasic
//
//  Created by Jaya Shen on 2019/10/22.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "ViewController.h"
#import "stars.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *table;

@property stars *star;
@property UIImageView *image;
@property UILabel *label;
@property UIView *aview;

@property UILabel *movie;

@property BOOL flag;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _flag = false;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 812) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    _table.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_table];
    
    _movie = [[UILabel alloc] init];
    _movie.text = @"电影";
    _movie.font = [UIFont systemFontOfSize:20];
    _movie.textAlignment = NSTextAlignmentCenter;
    _movie.frame = CGRectMake(137, 2, 101, 20);
    [self.navigationController.navigationBar addSubview:_movie];
    
    _aview = [[UIView alloc] init];
    
    _star = [[stars alloc] initWithFrame:CGRectMake( 30, 20, 365, 15)];
    _star.starScore = 7.1;
    [_aview addSubview:_star];
    
    _image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 40)];
    _image.image = [UIImage imageNamed:@"begin_1.jpg"];
    [_aview addSubview:_image];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 355, 15)];
    _label.text = @"双子杀手";
    [_aview addSubview:_label];
    
    _aview.frame = CGRectMake(20, 8, 130, 40);
    _aview.clipsToBounds = YES;
    _aview.alpha = 0;
    [self.navigationController.navigationBar addSubview:_aview];
}

- (void)click {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame;
        frame = self->_aview.frame;
        frame.origin.y -= 5;
        self->_aview.frame = frame;
        self->_aview.alpha = 1;
        frame = self->_movie.frame;
        frame.origin.y -= 5;
        self->_movie.frame = frame;
        self->_movie.alpha = 0;
    }];
}

- (void)clickReturn {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame;
        frame = self->_movie.frame;
        frame.origin.y += 5;
        self->_movie.frame = frame;
        self->_movie.alpha = 1;
        frame = self->_aview.frame;
        frame.origin.y += 5;
        self->_aview.frame = frame;
        self->_aview.alpha = 0;
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 812;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *sjy = [[UITableViewCell alloc] init];
    return sjy;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > 10 && _flag == false) {
        _flag = true;
        [self click];
    } else if (scrollView.contentOffset.y <= 10 && _flag == true) {
        _flag = false;
        [self clickReturn];
    }
}

@end
