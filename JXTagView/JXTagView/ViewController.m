//
//  ViewController.m
//  JXTagView
//
//  Created by mac on 17/7/15.
//  Copyright © 2017年 JXIcon. All rights reserved.
//

#import "ViewController.h"
#import "JXTagView.h"

@interface ViewController ()

@property(nonatomic, strong) JXTagView *tagView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 属性
    self.tagView = [[JXTagView alloc]init];
    
    self.tagView.frame = CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height * 0.4);
    
    
    __block JXTagFrame *tagFrame = [[JXTagFrame alloc]init];
    
    NSMutableArray *tagsArray = [NSMutableArray arrayWithArray:@[@"带我哈I",@"的博帕尔后怕封号",@"的家具欧派金额",@"得拿的偶奇偶发金额哦",@"的奋斗",@"德芙",@"到金额大二",@"的厚爱的",@"德比"]];
    
    tagFrame.tagsArray = tagsArray;
    self.tagView.tagsFrame = tagFrame;
    
    self.tagView.showDelete = YES;
    self.tagView.selectBgColor = [UIColor redColor];
    
    
    __weak typeof(self) weakSelf = self;
    [self.tagView setSelectIndexBlock:^(NSInteger index) {
       
        
    }];
    
    [self.tagView setDeleteIndexBlock:^(NSInteger index) {
        
        [tagsArray removeObjectAtIndex:index];
        tagFrame.tagsArray = tagsArray;
        weakSelf.tagView.tagsFrame = tagFrame;
        [weakSelf.tagView updateTags];
                
    }];
    
    
    [self.view addSubview:self.tagView];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
