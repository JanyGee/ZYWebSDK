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
}

- (IBAction)login:(id)sender {
    
    __weak typeof(self) weakSelf = self;
    [[ZYWebSDKManager shareZYWebSDKManager] loginSuccess:^(NSDictionary * _Nonnull dic) {
        NSLog(@"登录成功----%@",dic);
        /*
         返回字段说明
         userid：用户id
         token：token验证
         */
        __strong typeof (weakSelf)strongSelf = weakSelf;
        strongSelf.userId = [NSString stringWithFormat:@"%@", [dic objectForKey:@"userId"]];
    } failRes:^{
        NSLog(@"登录失败");
    }];
    
}

//购买
- (IBAction)shopping:(id)sender {
    
    NSDictionary *dic = @{
                          @"goodsPrice":@"6.00",                //商品价格
                          @"productId":@"1175",                 //商品ID
                          @"gameOrderId":[self randomNumberNO], //订单号，[self randomNumberNO]这是测试参数，请填入游戏给到的参数
                          @"gameZoneId":@"2",                   //游戏区服ID
                          @"roleId":@"22",                      //角色ID
                          @"level":@"222",                      //角色等级
                          @"notifyUrl":@"https://www.baidu.com",//回调地址
                          @"cpPrivateInfo":@"sddaaddd"          //透传参数，给渠道预留的参数，如果不用请传@""
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
                          @"gameZoneId":@"1",   //游戏区服ID
                          @"gameZoneName":@"11",//游戏区服名称
                          @"guildName":@"11",   //公会名称
                          @"roleId":@"11",      //角色ID
                          @"level":@"22",       //角色等级
                          @"roleName":@"jany",  //角色名称
                          @"vipLevel":@"11"     //角色VIP等级
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
                          @"gameZoneId":@"1",   //游戏区服ID
                          @"gameZoneName":@"2", //游戏区服名称
                          @"guildName":@"aa",   //公会名称
                          @"roleBalance":@"2",  //金币
                          @"roleId":@"22",      //角色ID
                          @"level":@"222",      //角色等级
                          @"roleName":@"jany",  //角色名字
                          @"vipLevel":@"11",    //角色VIP等级
                          @"submitType":@"1"    // 1: 进入游戏   2: 创建角色    3: 角色升级
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
