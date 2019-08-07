掌娱网游SDK接入文档帮助文档
（2.0）
修订日期：2019年8月6日




1.接入SDK；
自动集成
·1.1.通pod方式集成，集成指令:pod ‘ZYWebSDK’，版本从2.0开始;

手动集成
·1.2.导入ZYWebSDK.framework、ZYWebSDKBundle.bundle文件；注意导入时的勾选项，如下图：



·1.3.在项目的info.plist文件中一定要加入NSPhotoLibraryAddUsageDescription、NSPhotoLibraryUsageDescription两个获取用户权限的key，描述说明一定要写清楚，还需要设置App Transport Security Settings；


·1.4.在项目的Build Settings中设置Other Linker Flags -> -ObjC;


·1.5.需要导入libsqlite3.0.tbd和StoreKit.framework;





2.使用方法；

·2.1.初始化，对应参数平台会提供；

    [[ZYWebSDKManager shareZYWebSDKManager] initWithGameKey:@"xxxxxxx" promoteID:@"xxx" gameAppID:@"xxxx"];

·2.2.登录监听；

    __weak typeof(self) weakSelf = self;
    [[ZYWebSDKManager shareZYWebSDKManager] loginSuccess:^(NSDictionary * _Nonnull dic) {
        NSLog(@"登录成功----%@",dic);
        __strong typeof (weakSelf)strongSelf = weakSelf;
        strongSelf.userId = [NSString stringWithFormat:@"%@", [dic objectForKey:@"userId"]];
    } failRes:^{
        NSLog(@"登录失败");
    }];



·2.3.提交角色信息，输入参数有限制且参数固定；

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


·2.4.支付，请按照给定的参数字段传输数据，否则支付不成功，

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

·2.5.注销登录

    [[ZYWebSDKManager shareZYWebSDKManager] logoutSuccess:^{
        NSLog(@"退出成功");
    } fail:^{
        NSLog(@"退出失败");
    }];
