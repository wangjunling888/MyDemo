//
//  CQSideBarManager.m
//  CQSideBarManager
//
//  Created by heartjoy on 2017/3/7.
//  Copyright © 2017年 heartjoy. All rights reserved.
//

#import "CQSideBarManager.h"

@interface CQSideBarManager ()
{
    UIView *_contentView;
}

@property (nonatomic, strong) UIWindow *currentWindow;
@property (nonatomic, strong) UIView *shadeView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, assign) BOOL canCloseSideBar;
/**
 * 侧边栏结束显示位置(默认为(屏幕宽,0))
 */
@property (nonatomic, assign) CGPoint endOffsetPoint;

@property (nonatomic, weak) id<CQSideBarManagerDelegate> delegate;

@end

@implementation CQSideBarManager

+ (instancetype)sharedInstance
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _currentWindow = SIDEBAR_KEY_WINDOW;
    _startOffsetPoint = SIDEBAR_START_POINT;
    _endOffsetPoint = CGPointMake(_currentWindow.cq_width, 0);
    
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGes:)];
    [_currentWindow addGestureRecognizer:panGes];
}

/*
 * 设备方向改变的处理
 */
- (void)handleDeviceOrientationChange:(NSNotification *)notification
{
    _shadeView.frame = _currentWindow.frame;
    _contentView.frame = CGRectMake(_startOffsetPoint.x, _startOffsetPoint.y, _currentWindow.cq_width - _startOffsetPoint.x, _currentWindow.cq_height - _startOffsetPoint.y);
}

- (void)openSideBar:(id<CQSideBarManagerDelegate>)delegate
{
    _delegate = delegate;
    _contentView = nil;
    
    if (!_shadeView) {
        _shadeView = [[UIView alloc] initWithFrame:_currentWindow.frame];
       
    }
    [_currentWindow addSubview:_shadeView];

    self.canCloseSideBar = YES;

    if (_delegate) {
        if ([_delegate respondsToSelector:@selector(viewForSideBar)]) {
            _contentView = [self.delegate viewForSideBar];
            /*
             * 重置设置抽屉视图的初始位置
             */
            _contentView.cq_x = _currentWindow.cq_width;
        }
        
        if ([_delegate respondsToSelector:@selector(canCloseSideBar)]) {
            self.canCloseSideBar = [self.delegate canCloseSideBar];
        }
        
        NSAssert(_contentView != nil, CQSideBarOpenErrorText);
    }
    
    [_currentWindow addSubview:_contentView];
    
    [self openAnimation];
    
}

- (void)closeSideBar
{
    if (_contentView) {
        [self closeAnimation];
    }
}

- (void)openAnimation
{
    [UIView animateWithDuration:SIDEBAR_ANIMATE_DURATION animations:^{
        _contentView.frame = CGRectMake(_startOffsetPoint.x, _startOffsetPoint.y, _currentWindow.cq_width - _startOffsetPoint.x, _currentWindow.cq_height - _startOffsetPoint.y);
        _shadeView.backgroundColor = SIDEBAR_COLOR(0, 0, 0, 0.5f);
    }];
    
    [self addObserverDeviceOrientationNotification];
}

- (void)closeAnimation {
    [UIView animateWithDuration:SIDEBAR_ANIMATE_DURATION animations:^{
        _contentView.frame = CGRectMake(_endOffsetPoint.x, _endOffsetPoint.y,_currentWindow.cq_width, _currentWindow.cq_height);
         _shadeView.backgroundColor = SIDEBAR_COLOR(0, 0, 0, 0.0f);
    } completion:^(BOOL finished) {

        [_shadeView removeFromSuperview];
        [_contentView removeFromSuperview];

        [self removeObserverDeviceOrientationNotification];
        
        _shadeView = nil;
        _contentView = nil;
        _delegate = nil;

    }];
}

- (void)addObserverDeviceOrientationNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleDeviceOrientationChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)removeObserverDeviceOrientationNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

#pragma mark -----Getter
- (UIView *)viewInSideSideBar
{
    return _contentView;
}

- (UITapGestureRecognizer *)tapGestureRecognizer
{
    if (!_tapGestureRecognizer) {
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeSideBar)];
    }
    
    return _tapGestureRecognizer;
}

#pragma mark -----Setter
- (void)setCanCloseSideBar:(BOOL)canCloseSideBar
{
    _canCloseSideBar = canCloseSideBar;
    if (_shadeView) {
        if (!_canCloseSideBar) {
            [_shadeView removeGestureRecognizer:_tapGestureRecognizer];
        }else {
            [_shadeView addGestureRecognizer:self.tapGestureRecognizer];
        }
    }
}

- (void)setStartOffsetPoint:(CGPoint)startOffsetPoint
{
    _startOffsetPoint = startOffsetPoint;
}



- (void)panGes:(UIPanGestureRecognizer *)pan {
    
    //获取滑动距离
    CGPoint translatedPoint = [pan translationInView:_currentWindow];
    CGFloat offsetX = translatedPoint.x;
    
    
    //获取加速度方向, x > 0的时候为向右
    CGPoint velocity = [pan velocityInView:_currentWindow];
  
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged: {
           
            NSLog(@"%lf",offsetX);
            if (offsetX > 3) {
                 _contentView.frame = CGRectMake(offsetX+35, 0, _contentView.bounds.size.width, _contentView.bounds.size.height);
             CGFloat alpha = 0.5 * (_contentView.bounds.size.width - offsetX)/_contentView.bounds.size.width;
                
                _shadeView.backgroundColor = SIDEBAR_COLOR(0, 0, 0, alpha);
            }
            
            
           
        } break;
        case UIGestureRecognizerStateEnded: {
           
            if(velocity.x > 0) {
                [self closeSideBar];
                
            } else {
                [self openAnimation];
                
            }
            
        } break;
        default:
            break;
    }
}


@end
