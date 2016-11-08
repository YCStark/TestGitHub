//
//  ViewController.h
//  UIImage1
//
//  Created by yuanch on 16/3/11.
//  Copyright © 2016年 yuanch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrV;
@property (strong, nonatomic) UIPageControl *pageC;
@property (strong, nonatomic) UIImageView *imgVLeft;
@property (strong, nonatomic) UIImageView *imgVCenter;
@property (strong, nonatomic) UIImageView *imgVRight;
@property (strong, nonatomic) UILabel *lblImageDesc;
@property (strong, nonatomic) NSMutableDictionary *mDicImageData;
@property (assign, nonatomic) NSUInteger currentImageIndex;
@property (assign, nonatomic) NSUInteger imageCount;



@end

