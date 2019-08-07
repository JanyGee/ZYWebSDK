//
//  ViewController.m
//  ZYWebSDKDemo
//
//  Created by zhangyu on 2019/6/27.
//  Copyright © 2019 Octopus. All rights reserved.
//

#import "ViewController.h"
#import <ZYWebSDK/ZYWebSDK.h>
@interface ViewController ()
@property (nonatomic, copy)NSString *userId;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    [[ZYWebSDKManager shareZYWebSDKManager] loginSuccess:^(NSDictionary * _Nonnull dic) {
        NSLog(@"登录成功----%@",dic);
        __strong typeof (weakSelf)strongSelf = weakSelf;
        strongSelf.userId = [NSString stringWithFormat:@"%@", [dic objectForKey:@"userId"]];
    } failRes:^{
        NSLog(@"登录失败");
    }];
}

//购买
- (IBAction)shopping:(id)sender {
    
    NSDictionary *dic = @{
                          @"goodsPrice":@"6.00",
                          @"productId":@"1733",
                          @"gameOrderId":[self randomNumberNO],
                          @"gameZoneId":@"2",
                          @"roleId":@"22",
                          @"level":@"222",
                          @"notifyUrl":@"https://www.baidu.com",
                          @"cpPrivateInfo":@"sddaaddd"
                          };
    
    [[ZYWebSDKManager shareZYWebSDKManager] shoppingWithParameter:dic successRes:^{
        NSLog(@"购买成功");
    } failRes:^{
        NSLog(@"购买失败");
    }];
}

//登出
- (IBAction)logout:(id)sender {
    [[ZYWebSDKManager shareZYWebSDKManager] logoutSuccess:^{
        NSLog(@"退出成功");
    } fail:^{
        NSLog(@"退出失败");
    }];
}

//绑定区服
- (IBAction)bindGameZone:(id)sender {
    
    NSDictionary *dic = @{
                          @"gameZoneId":@"1",
                          @"gameZoneName":@"11",
                          @"guildName":@"11",
                          @"roleId":@"11",
                          @"level":@"22",
                          @"roleName":@"jany",
                          @"vipLevel":@"11"
                          };
    
    [[ZYWebSDKManager shareZYWebSDKManager] bindGameZoneWithParameter:dic success:^{
        NSLog(@"绑定成功");
    } fail:^{
        NSLog(@"绑定失败");
    }];
}

//提交角色信息（必接）
- (IBAction)submit:(id)sender {
    
    NSDictionary *dic = @{
                          @"gameZoneId":@"1",
                          @"gameZoneName":@"2",
                          @"guildName":@"aa",
                          @"roleBalance":@"2",
                          @"roleId":@"22",
                          @"level":@"222",
                          @"roleName":@"jany",
                          @"vipLevel":@"11",
                          @"submitType":@"1"// 1: 进入游戏   2: 创建角色    3: 角色升级     4: 退出游戏
                          };
    
    [[ZYWebSDKManager shareZYWebSDKManager] submitGameWithParameter:dic success:^{
        NSLog(@"提交信息成功");
    } fail:^{
        NSLog(@"提交信息失败");
    }];
    
}

//显示悬浮按钮
- (IBAction)showFlaotView:(id)sender {
    
    [[ZYWebSDKManager shareZYWebSDKManager] showFlaotView];
}

//隐藏悬浮按钮
- (IBAction)hiddenFlaotView:(id)sender {
    
    [[ZYWebSDKManager shareZYWebSDKManager] hiddenFlaotView];
}

- (NSString *)randomNumberNO
{
    NSArray *arrStr = @[@6,@7,@8,@9,@10,@11];
    unsigned index = rand() % arrStr.count;
    NSInteger kNumber = [[arrStr objectAtIndex:index] integerValue];
    
    NSString *sourceStr = @"0123456789";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = arc4random() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}
@end
