//
//  ShareView.h
//  ScreenshotsShareView
//
//  Created by 苟应航 on 2018/3/31.
//  Copyright © 2018年 GouHang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShareViewDelegate <NSObject>

-(void)shareAction:(NSInteger)tag;

@end



@interface ShareView : UIView
@property(nonatomic,assign) id<ShareViewDelegate> delegate;
-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)images;
@end
