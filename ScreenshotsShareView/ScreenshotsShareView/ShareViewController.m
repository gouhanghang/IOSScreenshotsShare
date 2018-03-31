//
//  ShareViewController.m
//  ScreenshotsShareView
//
//  Created by 苟应航 on 2018/3/31.
//  Copyright © 2018年 GouHang. All rights reserved.
// test

#import "ShareViewController.h"
#import "ImageCell.h"
#import "PickTureController.h"
@interface ShareViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView *collection;
@property(nonatomic,strong)NSArray *imagearr;
@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    //    //    设置collectionView滚动方向
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    UICollectionView *collevtionview=[[UICollectionView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT-SafeAreaTopHeight) collectionViewLayout:layout];
    collevtionview.collectionViewLayout=layout;
    collevtionview.backgroundColor=[UIColor whiteColor];
    collevtionview.dataSource = self;
    collevtionview.delegate = self;
    collevtionview.showsVerticalScrollIndicator = NO;
    [collevtionview registerNib:[UINib nibWithNibName:@"ImageCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"ImageCell"];
    [self.view addSubview:collevtionview];
    
    _imagearr=@[@"https://wx3.sinaimg.cn/mw690/a188a11bgy1fng87hn0wxj21f02ionph.jpg",
                @"https://wx4.sinaimg.cn/mw690/a188a11bgy1fng88rcf82j22io1f07wp.jpg",
                @"https://wx1.sinaimg.cn/mw690/a188a11bgy1fo7ryb6itwj20u010j4qp.jpg",
                @"https://wx2.sinaimg.cn/mw690/a188a11bgy1fng8889x9uj22io1f01l3.jpg",
                @"https://wx4.sinaimg.cn/mw690/a188a11bgy1fng896cq58j20qo1be1kx.jpg",
                @"https://wx3.sinaimg.cn/mw690/a188a11bly1fnwlchky2kj20qo0f0tbb.jpg",
                @"https://wx1.sinaimg.cn/mw690/a188a11bly1fnwlbe9gsnj20qo1bfdn8.jpg"];
    
}
//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imagearr.count;
}
//这个你不知道可以撞墙了.没救了
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCell *cell = (ImageCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    [cell.images sd_setImageWithURL:[NSURL URLWithString:_imagearr[indexPath.row]] placeholderImage:nil];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH/2-5, 200);
}
////设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PickTureController *vc=[PickTureController new];
    vc.picturearr=_imagearr;
    vc.indexpictrue=indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
@end
