//
//  PickTureController.m
//  ScreenshotsShareView
//
//  Created by 苟应航 on 2018/3/31.
//  Copyright © 2018年 GouHang. All rights reserved.
//

#import "PickTureController.h"

@interface PickTureController ()<UIScrollViewDelegate>
{
    UIImageView *_pickimage;
    UILabel *_numberlabes;
}
@property(nonatomic,strong)UIScrollView *pictuescrollview;

@end

@implementation PickTureController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pictuescrollview=[[UIScrollView alloc]initWithFrame:SCREEN_BOUNDS];
    _pictuescrollview.backgroundColor=[UIColor blackColor];
    _pictuescrollview.pagingEnabled=YES;
    _pictuescrollview.clipsToBounds=YES;
    _pictuescrollview.delegate=self;
    
    _pictuescrollview.bounces=NO;
    _pictuescrollview.contentSize=CGSizeMake(SCREEN_WIDTH*self.picturearr.count, 0);
    _pictuescrollview.contentOffset=CGPointMake(SCREEN_WIDTH*self.indexpictrue, 0);
    [self.view addSubview:_pictuescrollview];
    
    for (int i=0; i<self.picturearr.count; i++) {
        UIImageView *pickimage=[UIImageView new];
        pickimage.backgroundColor=[UIColor blackColor];
        pickimage.userInteractionEnabled=YES;
        pickimage.contentMode=UIViewContentModeScaleAspectFit;
        UITapGestureRecognizer *agreeDealabegestures = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(navigationsLeftBtnClick)];
        [pickimage addGestureRecognizer:agreeDealabegestures];
        [pickimage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.picturearr[i]]]];
        [_pictuescrollview addSubview:pickimage];
        _pickimage=pickimage;
        [pickimage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0).mas_offset(SCREEN_WIDTH*i);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(SCREEN_HEIGHT);
        }];
    }
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(navigationsLeftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitle:@"< 返回" forState:UIControlStateNormal];
    backBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [backBtn setImage:XTDImage(@"backWhite") forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(self.view.mas_top).mas_offset(30);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    UILabel *labe=[UILabel new];
    labe.text=[NSString stringWithFormat:@"%ld/%lu",(long)self.indexpictrue+1,(unsigned long)self.picturearr.count];
    labe.textColor=[UIColor whiteColor];
    labe.font=[UIFont systemFontOfSize:12];
    _numberlabes=labe;
    [self.view addSubview:labe];
    [labe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.bottom.mas_equalTo(-20);
    }];
}
-(void)navigationsLeftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint  offset=scrollView.contentOffset;
    int numbers=[[NSString stringWithFormat:@"%0.0f",offset.x/SCREEN_WIDTH] intValue];
    _numberlabes.text=[NSString stringWithFormat:@"%d/%lu",numbers+1,(unsigned long)self.picturearr.count];
}
@end

