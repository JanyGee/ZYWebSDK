//
//  ZYWebSDKManager.h
//  ZYWebSDK
//
//  Created by zhangyu on 2019/6/27.
//  Copyright © 2019 Octopus. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYWebSDKManager : NSObject

/**
 对象单利

 @return ZYWebSDKManager
 */
+ (instancetype)shareZYWebSDKManager;


/**
 初始化接口

 @param gameKey 掌娱后台生成的gamekey
 @param promoteID 掌娱后台生成的promoteID
 @param gameAppID 掌娱后台生成的gameAppID
 @param success 成功回调
 @param fail 失败回调
 */
- (void)initWithGameKey:(NSString *)gameKey promoteID:(NSString *)promoteID gameAppID:(NSString *)gameAppID success:(void(^)(void))success fail:(void(^)(void))fail;


/**
 弹出登录界面

 @param success 成功回调 userid：用户id token：token验证
 @param fail 失败回调
 */
- (void)loginSuccess:(void(^)(NSDictionary *dic))success failRes:(void(^)(void))fail;


/**
 绑定区服

 @param dic 绑定区服所需要的参数eg（dic = {
 @"gameZoneId":@"",         //游戏区服ID
 @"gameZoneName":@"",       //游戏区服名称
 @"guildName":@"",          //公会名称
 @"roleId":@"",             //角色ID
 @"level":@"",              //角色等级
 @"roleName":@"",           //角色名称
 @"vipLevel":@""            //角色VIP等级
 }）以上参数为必传⚠️
 
 @param success 成功回调
 @param fail 失败回调
 */
- (void)bindGameZoneWithParameter:(NSDictionary *)dic success:(void(^)(void))success fail:(void(^)(void))fail;


/**
 提交角色信息(必接)eg（dic = {
 @"gameZoneId":@"",      //游戏区服ID
 @"gameZoneName":@"",    //游戏区服名称
 @"guildName":@"",       //公会名称
 @"roleBalance":@"",     //金币
 @"roleId":@"",          //角色ID
 @"level":@"",           //角色等级
 @"roleName":@""         //角色名字
 @"vipLevel":@""         //角色VIP等级
 @"submitType":@""       //1: 进入游戏   2: 创建角色    3: 角色升级     4: 退出游戏
 }）以上参数为必传⚠️
 
 @param dic 角色信息
 @param success 成功回调
 @param fail 失败回调
 */
- (void)submitGameWithParameter:(NSDictionary *)dic success:(void(^)(void))success fail:(void(^)(void))fail;


/**
 购买商品

 @param dic 参数字典 eg（dic = {
 @"goodsPrice":@"6.00", //单位为元保留小数点后两位
 @"productId":@"1385",  //虚拟商品在APP Store中的ID
 @"gameOrderId":@"",    //订单ID
 @"gameZoneId":@"",     //游戏区服ID
 @"roleId":@"",         //角色ID
 @"level":@"",          //角色等级
 @"notifyUrl":@""       //回调地址
 @"roleName":@""        //角色名字
 @"cpPrivateInfo":@""   //透传参数，给渠道预留的参数，如果不用请传@""
 }）以上参数为必传⚠️
 @param success 成功回调
 @param fail 失败回调
 */
- (void)shoppingWithParameter:(NSDictionary *)dic successRes:(void(^)(void))success failRes:(void(^)(void))fail;


/**
 退出

 @param success 退出成功
 @param fail 退出失败
 */
- (void)logoutSuccess:(void(^)(void))success fail:(void(^)(void))fail;


/**
 显示悬浮按钮
 */
- (void)showFlaotView;


/**
 隐藏悬浮按钮
 */
- (void)hiddenFlaotView;
@end

NS_ASSUME_NONNULL_END
