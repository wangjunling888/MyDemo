//
//  TaiChiMacroDefinesHeader.h
//  QuanMinTaiChi
//
//  Created by LiuXin on 2016/10/20.
//  Copyright © 2016年 LiuXin. All rights reserved.
//

#import <Masonry.h>


#pragma mark - 宏定义
//配置使用的网络环境, 1为线上环境, 0为测试环境, 打包不同环境需要手动修改
#define TCNetworkEnvironment 0

//生产环境的测试环境, 0为线上测试环境, 1为线上正式环境, 需手动修改
#define TCNetworkProductEnvironment 0


//log日志打印宏
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"-------------debug----------\nFile:%s\tLine:%d\t%s\n-------------debug----------\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#define NSLog(FORMAT, ...) nil
#endif

//app代理
#define TaiChiAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//位置高度
#define kStatusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)  //状态栏高度
#define kNavigationBarViewHeight (self.navigationController.navigationBar.bounds.size.height)  //导航栏高度
#define kTabbarHeight ([self.parentViewController.parentViewController isKindOfClass:[TaiChiMainTabBarController class]] ? ((TaiChiMainTabBarController *)(self.parentViewController.parentViewController)).tabBar.bounds.size.height : 49) //tab高度

// 屏幕大小
#define mainScreenWidth  [UIScreen mainScreen].bounds.size.width
#define mainScreenHeight [UIScreen mainScreen].bounds.size.height
#define mainScreenBounds [[UIScreen mainScreen] bounds]

//置顶按钮直径
#define kAppsystemTopBtn_diameter 48.f

//系统固定值
//线宽和圆角弧度
#define kTaiChiCustomLineWidth 1.0f
#define kTaiChiCustomCornerRadius 4.0f
//banner的图片长宽比
#define kTaiChiBannerW_H_ratio (1242.f/540.f)
//视频的宽高比
#define kTCVideoW_H_ratio (16.f/9.f)
//赛事封面头图宽高比
#define kTCCompetitionPictureW_H_ratio (710.f/256.f)

//课程背景的宽高比
#define kTaiChiCourseBGW_H_ratio 2.76

#define TC_Custom_nav_height (iPhoneX ? 88.f : 64.f)

#define TC_tabbar_height (iPhoneX ? (49.f+34.f) : 49.f)
#define TC_statusBar_height (iPhoneX ? 44.f : 20.f)

//字号
//查看更多按钮的字号, 用在cell分组的组头部分, 有查看更多的时候
#define kTaichiWatchMoreLabelFontSize 13.f



//颜色定义宏
#define RGBA_HEX(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
#define RGB_HEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1]
#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
#define RGB(R/*红*/, G/*绿*/, B/*蓝*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:1]


#define kTaiChiViewControllerBackgroundColor [UIColor whiteColor]

#define kTaiChiTableViewGroupColor [UIColor colorWithRed:235/255.f green:236/255.f blue:239/255.f alpha:1]

#define kTaiChiMainColor1 [UIColor colorWithRed:58.0/255 green:57.0/255 blue:63.0/255 alpha:1.0]//主题深灰色
#define kTaiChiNavBarTintColor RGB(71, 74, 86)

#define kTaiChiButtonHiliColor [UIColor colorWithRed:84.0/255 green:84.0/255 blue:94.0/255 alpha:1.0]

#define kTaiChiButtonDisableColor kTaiChiTextFieldBorderColor

#define kTaiChiTextMainColor [UIColor blackColor]   //主字体颜色 黑色

#define kTaiChiTextLightBalckColor RGB_HEX(0x212124)

#define kTaiChiTextGrayColor [UIColor colorWithRed:133.0/255 green:133.0/255 blue:133.0/255 alpha:1.0]
#define kTaiChiTextLightGrayColor [UIColor colorWithRed:175.0/255 green:175.0/255 blue:184.0/255 alpha:1.0]

#define kTaiChiTextRedColor [UIColor colorWithRed:215.0/255 green:28.0/255 blue:17.0/255 alpha:1.0]//红色
#define kTaiChiMainYellowColor RGB(203, 160, 101)

#define kTaiChiSepratorLineColor [UIColor colorWithRed:240.0/255 green:239.0/255 blue:245.0/255 alpha:1.0]
#define kTaiChiYuanBaoYellowColor [UIColor colorWithRed:242.0/255 green:199.0/255 blue:0 alpha:1.0]
#define kTaiChiButton2NormalBackgroundColor [UIColor colorWithRed:45.0/255 green:165.0/255 blue:104.0/255 alpha:1.0]  //绿色按钮
#define kTaiChiButton2DisableBackgroundColor [UIColor colorWithRed:139.0/255 green:192.0/255 blue:165.0/255 alpha:1.0]
#define kTaiChiTextFieldBorderColor [UIColor colorWithRed:175.0/255 green:175.0/255 blue:184.0/255 alpha:1.0]
#define kTaiChiAPPGreenColor kTaiChiButton2NormalBackgroundColor

#define kTaiChiWatchMoreBtnGreenColor RGB(45, 165, 104)

#define kTaiChiWatchDetailBtnBlueColor RGB(41, 116, 200)
#define kTaiChiNicknameColor RGB(44, 112, 200)
#define KTaichiTopicColor RGB(38, 112, 188)



// 判断系统版本
#define IOS_10            ([[[UIDevice currentDevice] systemVersion] integerValue] == 10)

#define IOS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define IOS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define IOS_7             ([[[UIDevice currentDevice] systemVersion] integerValue] == 7)

#define IOS_6             ([[[UIDevice currentDevice] systemVersion] integerValue] == 6)

// 判断设备型号
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320, 480), [UIScreen mainScreen].bounds.size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320, 568), [UIScreen mainScreen].bounds.size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(375, 667), [UIScreen mainScreen].bounds.size) : NO)

#define iPhone6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(414, 736), [UIScreen mainScreen].bounds.size) : NO)

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(375, 812), [UIScreen mainScreen].bounds.size) : NO)

#define iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// 根据型号返回值
#define valuesForiPhone_4_5_6_6p_X_o(x,y,n,m,j,k)   (iPhoneX ? j : (iPhone6p ? m : (iPhone6 ? n : (iPhone5 ? y : (iPhone4 ? x : k)))))

#define valuesForiPhone_4_5_6_6p_o(x,y,n,m,k)   (iPhone6p ? m : (iPhone6 ? n : (iPhone5 ? y : (iPhone4 ? x : k))))
#define valuesForiPhone_45_6_6p_o(x,y,n,m)   (iPhone6p ? n : (iPhone6 ? y : (iPhone5 || iPhone4 ? x : m)))
#define valuesForiPhoneAutoScale_6p(x)       (iPhone6p ? x : x * (screenWidth / 414.f))
#define valuesForiPhoneAutoScale_6(x)       (x * (screenWidth / 375.f))
#define valuesForiPhoneAutoScale_5(x)       (iPhone5 ? x : x * (screenWidth / 320.f))

//UserDefaults Key
#define kTaiChiUserDefaultsKeyGlobalUserInfo (@"TaiChiUserDefaultsKeyGlobalUserInfo")
#define kTaiChiUserDefaultsKeyCheckSignSystemDataKey (@"TaiChiUserDefaultsKeyCheckSignSystemDataKey")
#define kTaiChiUserDefaultsKeyLastCheckSuccessDateKey (@"TaiChiUserDefaultsKeyLastCheckSuccessDateKey")  //记录用户上次成功签到的日期
#define kTaiChiUserDefaultsKeyNotificationOnOffKey (@"TaiChiUserDefaultsKeyNotificationOnOffKey")  //修炼提醒是否打开
#define kTaiChiUserDefaultsKeyNotificationTime (@"TaiChiUserDefaultsKeyNotificationTime")  //修炼提醒时间
#define kTaiChiUserDefaultsKeyNotificationCycle (@"TaiChiUserDefaultsKeyNotificationCycle")  //修炼提醒周期
#define kTaiChiUserDefaultsKeyUserMobileNetworkToDownloadVideos (@"TaiChiUserDefaultsKeyUserMobileNetworkToDownloadVideos")  //是否允许使用流量下载视频key
#define kTaiChiUserDefaultsKeySystemNoticeNewestNoticeDateKey (@"TaiChiUserDefaultsKeySystemNoticeNewestNoticeDateKey")  //记录系统最新的消息的日期，用于判断用户是否有未读消息
#define kTaiChiUserDefaultsKeyLastCacheBundleVersionKey (@"TaiChiUserDefaultsKeyLastCacheBundleVersionKey")  //存储上一次缓存的版本信息，用于判断欢迎页
#define kTaiChiUserDefaultsKeyLastCacheBundleVersionIntroduceKey (@"TaiChiUserDefaultsKeyLastCacheBundleVersionIntroduceKey")  //存储上一次缓存的版本信息，用于显示新功能介绍
#define kTaiChiUserDefaultsKeyAppSystemParameterKey (@"TaiChiUserDefaultsKeyAppSystemParameterKey")  //存储App固定参数的key，签到获取元宝数量都是从该key中获取
#define kTaiChiUserDefaultsKeyActivityNoticeIdCacheKey (@"TaiChiUserDefaultsKeyActivityNoticeIdCacheKey")  //活动通知的缓存id，记录上次的

#define kTaiChiUserDefaultsKeyMemberDeadlineNotificationEarlyDate (@"TaiChiUserDefaultsKeyMemberDeadlineNotificationEarlyDate")  //会员提醒到期的最早日期，在该日期之前不进行提醒

#define kTaiChiUserDefaultsKeyVideoWriteCommentAutoPopupView (@"TaiChiUserDefaultsKeyVideoWriteCommentAutoPopupView")  //视频看完后自动弹窗评论的key

//app通知
#define kTaiChiNofitificationCenterNameFirstClassCourseSynchonize (@"TaiChiNofitificationCenterNameFirstClassCourseSynchonize")  //第一级课程的两个实例之间的数据同步通知

#define WEAK_SELF __weak typeof(self) weakSelf = self;


#pragma mark - 枚举
//用户修炼状态
typedef NS_ENUM(NSInteger, UserCultivateStatus) {
    UserCultivateStatusNotStart = 0,  //未开始
    UserCultivateStatusProcessing = 10,  //进行中
    UserCultivateStatusFinished = 30,  //已完成
    UserCultivateStatusExamPassed = 20,  //考试通过
    UserCultivateStatusExamNotPassed = 21, //考试未通过
};


/**
 app 内部的类型
 */
typedef NS_ENUM(NSInteger, TCAPPType) {
    TCAPPTypeUnknown                    = 0,
    TCAPPTypeExam                       = 1,    //考试（江湖）
    TCAPPTypeCulture                    = 2,    //太极文化
    TCAPPTypeUser                       = 3,    //用户
    TCAPPTypeSystemCourseComment        = 4,    //系统课程评论
    TCAPPTypeMember                     = 5,    //太极会员
    TCAPPTypeVideo                      = 6,    //会员视频
    TCAPPTypeVideoComment               = 7,    //会员视屏评论
    TCAPPTypeAnswerQuestion             = 8,    //名师解答（会员交流）
    TCAPPTypeCommentComment             = 9,    //对评论进行评论
    TCAPPTypeRecharge                   = 10,   //充值
    TCAPPTypeStatuses                   = 11,   //动态
    TCAPPTypeStatusesComment            = 12,   //动态的评论
    TCAPPTypeCompititionVideo           = 13,   //比赛视频
    TCAPPTypeCompititionSignUp          = 14,   //比赛报名费
    TCAPPTypeStatuesTopic               = 15,   //话题
    TCAPPTypeCultureComment             = 16,   //太极文化评论表
    TCAPPTypeSystemCourse               = 17,   //系统课程
    TCAPPTypeAllComment                 = 18,   //全部评论(评论总类)
    TCAPPTypeBanner                     = 19,   //banner
    TCAPPTypeWebURL                     = 20,   //web链接跳转
    TCAPPTypeVideoYearly                = 21,   //会员视频年包
    TCAPPTypeCompetitionGroup           = 22,   //太极赛事组
    TCAPPTypeCompetitionVideoComment    = 23,   //赛事视频评论
    TCAPPTypeAward                      = 24,   //打赏, 转账
    TCAPPTypeSportGroup                 = 25,   //太极团
    TCAPPTypeCelebrity                  = 26,   //名师
    TCAPPTypeCelebrityCourse            = 27,   //名师课程
    TCAPPTypeCelebrityCourseVideo       = 28,   //名师课程视频
    TCAPPTypeCelebrityCourseVideoComment= 29,   //名师课程评论
};


/**
 收藏类型
 */
typedef NS_ENUM(NSInteger, TCFavType) {
    TCFavTypeUnknown = 0,
    TCFavTypeWebURL = 1,  //web链接，collection是url
    TCFavTypeApp = 2,  //app链接，就是收藏自己的东西，如太极文化，视频等,collection是id
    TCFavTypeString = 3,  //仅文字，collection是字符串，最大500字
    TCFavTypeImage = 4, //仅图片，collection是图片url
};


/**
 比赛视频的状态
 */
typedef NS_ENUM(NSInteger, TCCompetitionVideoStatus) {
    TCCompetitionVideoStatusNone = 101,  //视频未上传
    TCCompetitionVideoStatusWait = 201,  //审核中
    TCCompetitionVideoStatusSuccess = 301,  //成功
    TCCompetitionVideoStatusError = 401,  //失败
};


/**
 支付方式
 */
typedef NS_ENUM(NSInteger, TCPayPlatformType) {
    
    TCPayPlatFormTypeAliPay         = 1,  //支付宝
    TCPayPlatformTypeWXPay          = 2,  //微信
    TCPayPlatformTypeTaiChiPay      = 3,   //太极账户Pay
    TCPayPlatformTypeWXHelp         = 4,     //微信代付
    TCPayPlatformTypeApplePay       = 5,    //Apple pay
    
};


/**
 比赛的状态
 */
typedef NS_ENUM(NSInteger, TaiChiMatchManagerFuncStatus) {
    TaiChiMatchManagerFuncStatusError = 0,  //错误
    TaiChiMatchManagerFuncStatusClose = 1,  //关闭
    TaiChiMatchManagerFuncStatusNotStarted = 2,  //未开始
    TaiChiMatchManagerFuncStatusStarted = 3,  //已开始
    TaiChiMatchManagerFuncStatusFinish = 4,  //已
};

//banner位置
typedef NS_ENUM(NSInteger, TCBannerSceneType) {
    TCBannerSceneTypeUnKonw                 = 0,  //未知
    TCBannerSceneTypeMemberHome             = 1,  //会员首页
    TCBannerSceneTypeMemberActivity         = 2,  //会员活动
    TCBannerSceneTypeFind                   = 3,  //发现页面
    TCBannerSceneTypeHomeV4                 = 4,  //4.0首页banner
    TCBannerSceneTypeOpenAD                 = 5,    //开屏广告
};

///发布页面的类型
typedef NS_ENUM(NSInteger, TCPublishType) {
    TCPublishTypeUnRequst                   = 0,//不需要在本页面做网络请求
    TCPublishTypeComment                    = 1,//发布评论
    TCPublishtypeQuestion                   = 2,//提问题
    TCPublishTypeAnswer                     = 3, //回答问题
    TCPublishTypeVideoComment               = 4,  //评论视频
    TCPublishTypeCommentToComment           = 5,  //对评论的的评论
    TCPublishTypeSignature                  = 6,  //设置签名
    TCPublishTypeStatuesComment             = 7,  //对动态的评论
    TCPublishTypeRepost                     = 8,  //转发
    TCPublishTypeStatuesCommenttoComment    = 9, //动态评论的评论
    TCPublishTypeCultureComment             = 10,   //太极文化评论
    TCPublishTypeCultureCommentToComment    = 11,   //太极文化评论的评论
    TCPublishTypeCompetitionComment         = 12,   //赛事视频评论
    TCPublishTypeCelebrityCourseVideoComment= 13,   //名师课程视频评论
};


/**
 view点击button的block

 @param buttonIndex button tag
 */
typedef void(^TCButtonBlock)(NSInteger buttonIndex);


/**
 button点击block

 @param buttonIndex button tag
 @param sender 按钮
 */
typedef void(^TCButtonBlockWithObject)(NSInteger buttonIndex, id sender);


/**
 view tap事件block

 @param viewIndex view tag
 */
typedef void(^TCViewTapBlock)(NSInteger viewIndex);


