//
//  JXTagView.m
//  JXShopDemo
//
//  Created by mac on 17/4/20.
//  Copyright © 2017年 Mr.Gao. All rights reserved.
//

#import "JXTagView.h"


@interface JXTagView ()

@property (nonatomic, strong) UIButton *selectBtn;


@end

@implementation JXTagView

- (void)setTagsFrame:(JXTagFrame *)tagsFrame
{
    _tagsFrame = tagsFrame;
    
    for (NSInteger i = 0; i < tagsFrame.tagsArray.count; i++) {
        
        CGFloat deleteWH = 15;
        
        UIView *bgView = [[UIView alloc]init];
        CGRect rect = CGRectFromString(tagsFrame.tagsFrames[i]);
        rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width + deleteWH, rect.size.height + deleteWH);
        bgView.frame = rect;
        [self addSubview:bgView];
        
        
        UIButton *tagsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [tagsBtn setTitle:tagsFrame.tagsArray[i] forState:UIControlStateNormal];
        [tagsBtn setTitleColor:self.normalColor ? self.normalColor : [UIColor blackColor] forState:UIControlStateNormal];
        tagsBtn.titleLabel.font =  self.font ? self.font : TagsTitleFont;
        
        [tagsBtn setTitleColor:self.selectColor ? self.selectColor : [UIColor whiteColor] forState:UIControlStateSelected];
        
        tagsBtn.backgroundColor = self.bgColor ? self.bgColor : [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:1];
        
        tagsBtn.layer.borderWidth = 1;
        tagsBtn.layer.borderColor = self.border_color ? self.border_color.CGColor : [UIColor lightGrayColor].CGColor;
        tagsBtn.layer.cornerRadius = 4;
        tagsBtn.layer.masksToBounds = YES;
        
        [tagsBtn addTarget:self action:@selector(tagClick:) forControlEvents:UIControlEventTouchUpInside];
        tagsBtn.tag = i;
        
//        tagsBtn.frame = CGRectFromString(tagsFrame.tagsFrames[i]);
    
        tagsBtn.frame = CGRectMake(0, 0, bgView.bounds.size.width - 10, bgView.bounds.size.height - 10);
        [bgView addSubview:tagsBtn];
        
        
        /// 删除按钮
        
        UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        deleteBtn.frame = CGRectMake(tagsBtn.bounds.size.width - deleteWH * 0.5, -deleteWH * 0.5, deleteWH, deleteWH);
        [deleteBtn setImage:[UIImage imageNamed:@"yuan"] forState:UIControlStateNormal];
        deleteBtn.tag = 100 + i;
        [deleteBtn addTarget:self action:@selector(deleteAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [bgView addSubview:deleteBtn];
    }
    
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
  
}

- (void)deleteAction:(UIButton *)button{
    
    if (self.deleteIndexBlock) {
        self.deleteIndexBlock(button.tag - 100);
    }
}


- (void)tagClick:(UIButton *)button{
    
    if (_selectBtn.tag == button.tag && _selectBtn) {
        _selectBtn.selected = NO;
        _selectBtn.backgroundColor = self.bgColor ? self.bgColor : [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:1];
        _selectBtn = nil;
        return;
    }
    
    _selectBtn.selected = NO;
    _selectBtn.backgroundColor = self.bgColor ? self.bgColor : [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:1];
    
    button.selected = YES;
    
    _selectBtn = button;
    
    
    if (self.selectIndexBlock && _selectBtn) {
        self.selectIndexBlock(_selectBtn.tag);
    }
    
}

@end
