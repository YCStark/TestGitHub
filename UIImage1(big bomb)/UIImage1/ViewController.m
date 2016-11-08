//
//  ViewController.m
//  UIImage
//
//  Created by yuanch on 16/3/11.
//  Copyright © 2016年 yuanch. All rights reserved.
//

#import "ViewController.h"


#define kWidthOfScreen [[UIScreen mainScreen] bounds].size.width
#define kHeightOfScreen [[UIScreen mainScreen] bounds].size.height
#define kImageViewCount 3


#define kCount 6  //图片总张数
static long step = 0; //记录时钟动画调用次数


@interface ViewController ()
{
//    UIScrollView *_scrollView;
         UIImageView     *_currentImageView; //当前视图
         UIImageView     *_nextImageView;    //下一个视图
         UIImageView     *_previousView;     //上一个视图
//        CADisplayLink   *_timer;            //定时器
    
         BOOL _isDraging; //当前是否正在拖拽
}
/**
 *  加载图片数据
 */
- (void)loadImageData;

/**
 *  添加滚动视图
 */
- (void)addScrollView;

/**
 *  添加三个图片视图到滚动视图内
 */
- (void)addImageViewsToScrollView;

/**
 *  添加分页控件
 */
- (void)addPageControl;

/**
 *  添加标签；用于图片描述
 */
- (void)addLabel;

/**
 *  根据当前图片索引设置信息
 *
 *  @param currentImageIndex 当前图片索引；即中间
 */
- (void)setInfoByCurrentImageIndex:(NSUInteger)currentImageIndex;

/**
 *  设置默认信息
 */
- (void)setDefaultInfo;

/**
 *  重新加载图片
 */
- (void)reloadImage;

- (void)layoutUI;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//#if 0
//    NSString *path = [[NSBundle mainBundle]resourcePath];
//    //图片路径
//    NSString *imagePath = [NSString stringWithFormat:@"%@/horse.png",path];
//    //图片每次加载，效率低，加载完释放（大的图片）
//    //    UIImage *image = [[UIImage alloc] initWithContentsOfFile:imagePath];
//    //nsdata格式可用此加载
//    //    image = [UIImage alloc] initWithData:<#(nonnull NSData *)#>
//    
//    //图片混同内存中，效率高，程序结束才会释放。（小图片）
//    UIImage *image1 = [UIImage imageNamed:@"horse"];
//    
//    //载体
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image1];
//    //图片大小有载体控制
//    imageView.frame = CGRectMake(10, 100, 305, 500);
//    imageView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:imageView];
//    
//    //内容模式
//    //uiviewcontentmodescaletofill 默认充满整个载体
//    //uiviewcontentmodescaleAspectFill 拉伸不改变比例，充满最大的一边
//    //uiviewcontentmodescaleAspectFill 拉伸不改变比例，充满最xiao的一边
//    //
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//#endif
//
//    UILabel *print = [[UILabel alloc] init];
//    print.text = @"图片位置根据程序计算出来，默认6s Plus.";
//    print.frame = CGRectMake(50, 50, 400, 30);
//    
//    [self.view addSubview:print];
// //UIImageView动画 － 播放序列图
// NSMutableArray *imageArray = [[NSMutableArray alloc] init];
// for(int i = 1;i <=8;i++)
// {
// UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"bomb%d.png",i]];
// [imageArray addObject:image];
// 
// }
// UIImageView *imageView = [[UIImageView alloc] init];
// imageView.frame = CGRectMake(114/2, 150, 300, 300);
// [self.view addSubview:imageView];
// //设置动画数组
// imageView.animationImages = imageArray;
// //播放周期（秒）
// imageView.animationDuration = 2;
// //执行次数（0 － 代表无限，用stopanimating停止）
// imageView.animationRepeatCount = 0;
// //开始播放
// [imageView startAnimating];
////停止播放
////    [imageView stopAnimating];
////

    
    
//    [self layoutUI];
//    CGFloat width = 220;//self.view.bounds.size.width;
//    CGFloat height = 220;//self.view.bounds.size.height;
//    
//         _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 220, 220)];
//         _scrollView.contentSize = CGSizeMake(3 * 220, 0);
//         _scrollView.showsHorizontalScrollIndicator = NO;
//         _scrollView.pagingEnabled = YES;
//         _scrollView.delegate = self;
//         _scrollView.bounces = NO;
////         _scrollView.contentOffset = CGPointMake(width, 0);
//         [self.view addSubview:_scrollView];
//    
//         //初始化当前视图
//         _currentImageView = [[UIImageView alloc] init];
//         _currentImageView.image = [UIImage imageNamed:@"bomb1.png"];
//         _currentImageView.frame = CGRectMake(width, 0, width, height);
//         _currentImageView.contentMode = UIViewContentModeScaleAspectFill;
//         [_scrollView addSubview:_currentImageView];
//    
//         //初始化下一个视图
//         _nextImageView = [[UIImageView alloc] init];
//         _nextImageView.image = [UIImage imageNamed:@"bomb2.png"];
//         _nextImageView.frame = CGRectMake(width * 2, 0, width, height);
//         _nextImageView.contentMode = UIViewContentModeScaleAspectFill;
//         [_scrollView addSubview:_nextImageView];
//    
//         //初始化上一个视图
//         _previousView = [[UIImageView alloc] init];
//         _previousView.image = [UIImage imageNamed:@"bomb6.png"];
//         _previousView.frame = CGRectMake(0, 0, width, height);
//         _previousView.contentMode = UIViewContentModeScaleAspectFill;
//         [_scrollView addSubview:_previousView];
//    
//         // 时钟动画
//         _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
//         [_timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    
    //    图片的宽
         CGFloat imageW = self.scrollView.frame.size.width;
     //    CGFloat imageW = 300;
     //    图片高
         CGFloat imageH = self.scrollView.frame.size.height;
     //    图片的Y
         CGFloat imageY = 0;
     //    图片中数
         NSInteger totalCount = 5;
     //   1.添加5张图片
         for (int i = 0; i < totalCount; i++) {
                 UIImageView *imageView = [[UIImageView alloc] init];
         //        图片X
                 CGFloat imageX = i * imageW;
         //        设置frame
                 imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
         //        设置图片
        
             int j = i % 2;
             
                 NSString *name = [NSString stringWithFormat:@"page2-%d.jpg", j + 1];
                 imageView.image = [UIImage imageNamed:name];
         //        隐藏指示条
                 self.scrollView.showsHorizontalScrollIndicator = NO;
        
                 [self.scrollView addSubview:imageView];
             }
    
     //    2.设置scrollview的滚动范围
         CGFloat contentW = totalCount *imageW;
         //不允许在垂直方向上进行滚动
         self.scrollView.contentSize = CGSizeMake(contentW, 0);
    
     //    3.设置分页
         self.scrollView.pagingEnabled = YES;
//    self.scrollView 
    
     //    4.监听scrollview的滚动
         self.scrollView.delegate = self;
    
         [self addTimer];
}


- (void)nextImage
 {
    
     
     int page = (int)self.pageController.currentPage;
         if (page == 4) {
                 page = 0;
             }else
                 {
                         page++;
                     }
    
     //  滚动scrollview
         CGFloat x = page * self.scrollView.frame.size.width;
         self.scrollView.contentOffset = CGPointMake(x, 0);
     }

  //scrollview滚动的时候调用
 - (void)scrollViewDidScroll:(UIScrollView *)scrollView
 {
         NSLog(@"滚动中");
     //    计算页码
     //    页码 = (contentoffset.x + scrollView一半宽度)/scrollView宽度
         CGFloat scrollviewW =  scrollView.frame.size.width;
         CGFloat x = scrollView.contentOffset.x;
         int page = (x + scrollviewW / 2) /  scrollviewW;
         self.pageController.currentPage = page;
     }

 // 开始拖拽的时候调用
 - (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
 {
     //    关闭定时器(注意点; 定时器一旦被关闭,无法再开启)
     //    [self.timer invalidate];
         [self removeTimer];
     }

 - (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
 {
     //    开启定时器
         [self addTimer];
     }

 /**
    100  *  开启定时器
    101  */
 - (void)addTimer{
    
         self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
      }
 /**
     108  *  关闭定时器
     109  */
 - (void)removeTimer
 {
         [self.timer invalidate];
     }

#pragma mark 时钟动画调用方法
 - (void)update:(CADisplayLink *)timer
 {
         step++;
    
         if ((step % 120 != 0) || _isDraging) {
                 return;
             }
    
         CGPoint offset = _scrollView.contentOffset;
    
         offset.x += 320;
         if (offset.x > 640) {
                 offset.x = 320;
             }
    
         [_scrollView setContentOffset:offset animated:YES];
     }

 #pragma mark - 代理方法
 #pragma mark 准备开始拖动
// - (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
// {
//         _isDraging = YES;
//     }

 #pragma mark 视图停止滚动
 - (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
 {
         _isDraging = NO;
         step = 0;
     }

 #pragma mark 已经拖动
// - (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    
//         static int i = 1;//当前展示的是第几张图片
//    
//         float offset = scrollView.contentOffset.x;
//         if (_nextImageView.image == nil || _previousView.image == nil) {
//        
//                 //加载下一个视图
//                 NSString *imageName1 = [NSString stringWithFormat:@"bomb%d.png", i == kCount ? 1 : i + 1];
//                 _nextImageView.image = [UIImage imageNamed:imageName1];
//        
//                 //加载上一个视图
//                 NSString *imageName2 = [NSString stringWithFormat:@"bomb%d.png", i == 1 ? kCount : i - 1];
//                 _previousView.image = [UIImage imageNamed:imageName2];
//             }
//    
//         if (offset == 0) {
//                 _currentImageView.image = _previousView.image;
//                 scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width, 0);
//                 _previousView.image = nil;
//        
//                 if (i == 1) {
//                         i = kCount;
//                     }else{
//                             i -= 1;
//                         }
//        
//             }
//    
//         if (offset == scrollView.bounds.size.width * 2) {
//                 _currentImageView.image = _nextImageView.image;
//                 scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width, 0);
//                 _nextImageView.image = nil;
//        
//                 if (i == kCount) {
//                         i = 1;
//                     }else{
//                             i += 1;
//                         }
//        
//             }
//     }








- (void)loadImageData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ImageInfo" ofType:@"plist"];
    _mDicImageData = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    _imageCount = _mDicImageData.count;
}

- (void)addScrollView {
    _scrV = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _scrV.contentSize = CGSizeMake(kWidthOfScreen * kImageViewCount, kHeightOfScreen);
    _scrV.contentOffset = CGPointMake(kWidthOfScreen, 0.0);
    _scrV.pagingEnabled = YES;
    _scrV.showsHorizontalScrollIndicator = NO;
    _scrV.delegate = self;
    [self.view addSubview:_scrV];
}

- (void)addImageViewsToScrollView {
    //图片视图；左边
    _imgVLeft = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, kWidthOfScreen, kHeightOfScreen)];
    _imgVLeft.contentMode = UIViewContentModeScaleAspectFit;
    [_scrV addSubview:_imgVLeft];
    
    //图片视图；中间
    _imgVCenter = [[UIImageView alloc] initWithFrame:CGRectMake(kWidthOfScreen, 0.0, kWidthOfScreen, kHeightOfScreen)];
    _imgVCenter.contentMode = UIViewContentModeScaleAspectFit;
    [_scrV addSubview:_imgVCenter];
    
    //图片视图；右边
    _imgVRight = [[UIImageView alloc] initWithFrame:CGRectMake(kWidthOfScreen * 2.0, 0.0, kWidthOfScreen, kHeightOfScreen)];
    _imgVRight.contentMode = UIViewContentModeScaleAspectFit;
    [_scrV addSubview:_imgVRight];
}

- (void)addPageControl {
    _pageC = [UIPageControl new];
    CGSize size= [_pageC sizeForNumberOfPages:_imageCount]; //根据页数返回 UIPageControl 合适的大小
    _pageC.bounds = CGRectMake(0.0, 0.0, size.width, size.height);
    _pageC.center = CGPointMake(kWidthOfScreen / 2.0, kHeightOfScreen - 80.0);
    _pageC.numberOfPages = _imageCount;
    _pageC.pageIndicatorTintColor = [UIColor whiteColor];
    _pageC.currentPageIndicatorTintColor = [UIColor brownColor];
    _pageC.userInteractionEnabled = NO; //设置是否允许用户交互；默认值为 YES，当为 YES 时，针对点击控件区域左（当前页索引减一，最小为0）右（当前页索引加一，最大为总数减一），可以编写 UIControlEventValueChanged 的事件处理方法
    [self.view addSubview:_pageC];
}

- (void)addLabel {
    _lblImageDesc = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 40.0, kWidthOfScreen, 40.0)];
    _lblImageDesc.textAlignment = NSTextAlignmentCenter;
    _lblImageDesc.textColor = [UIColor whiteColor];
    _lblImageDesc.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]];
    _lblImageDesc.text = @"Fucking now.";
    [self.view addSubview:_lblImageDesc];
}

- (void)setInfoByCurrentImageIndex:(NSUInteger)currentImageIndex {
    NSString *currentImageNamed = [NSString stringWithFormat:@"bomb%lu.png", (unsigned long)currentImageIndex];
    _imgVCenter.image = [UIImage imageNamed:currentImageNamed];
    _imgVLeft.image = [UIImage imageNamed:[NSString stringWithFormat:@"bomb%lu.png", (unsigned long)((_currentImageIndex - 1 + _imageCount) % _imageCount)]];
    _imgVRight.image = [UIImage imageNamed:[NSString stringWithFormat:@"bomb%lu.png", (unsigned long)((_currentImageIndex + 1) % _imageCount)]];
    
    _pageC.currentPage = currentImageIndex;
    _lblImageDesc.text = _mDicImageData[currentImageNamed];
}

- (void)setDefaultInfo {
    _currentImageIndex = 0;
    [self setInfoByCurrentImageIndex:_currentImageIndex];
}

- (void)reloadImage {
    CGPoint contentOffset = [_scrV contentOffset];
    if (contentOffset.x > kWidthOfScreen) { //向左滑动
        _currentImageIndex = (_currentImageIndex + 1) % _imageCount;
    } else if (contentOffset.x < kWidthOfScreen) { //向右滑动
        _currentImageIndex = (_currentImageIndex - 1 + _imageCount) % _imageCount;
    }
    
    [self setInfoByCurrentImageIndex:_currentImageIndex];
}

- (void)layoutUI {
    self.view.backgroundColor = [UIColor blackColor];
    
    [self loadImageData];
    [self addScrollView];
    [self addImageViewsToScrollView];
    [self addPageControl];
    [self addLabel];
    [self setDefaultInfo];
}

//#pragma mark - UIScrollViewDelegate
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    [self reloadImage];
//    
//    _scrV.contentOffset = CGPointMake(kWidthOfScreen, 0.0);
//    _pageC.currentPage = _currentImageIndex;
//    
//    NSString *currentImageNamed = [NSString stringWithFormat:@"%bomblu.png", (unsigned long)_currentImageIndex];
//    _lblImageDesc.text = _mDicImageData[currentImageNamed];
//}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
