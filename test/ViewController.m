//
//  ViewController.m
//  test
//
//  Created by AdminZhiHua on 15/12/8.
//  Copyright © 2015年 AdminZhiHua. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <AFNetworking/UIWebView+AFNetworking.h>
#import "ZHHttpManager.h"
#import "ZHHttpManager+Cache.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic,strong) ZHHttpManager *manager;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = @"http://apistore.baidu.com/microservice/cityinfo";
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"cityname"] = @"北京";
    
//    [ZHHttpManager BPOST:path parameters:dict success:^(ZHRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        
//        NSLog(@"%@",responseObject);
//
//    } failure:^(ZHRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        
//    }];
    
//    [ZHHttpManager BGET:path parameters:dict success:^(ZHRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        
//        NSLog(@"%@",responseObject);
//        
//    } failure:^(ZHRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        
//    }];
    
//    NSLog(@"%@",NSHomeDirectory());
//    
//    ZHHttpManager *manager = [[ZHHttpManager alloc] init];
//    //必须强引用不然，对象会立即被销毁
////    self.manager = manager;
//    
//    NSString *url = @"http://software.swwy.com/Oz44OzhyNiQ0000.ts";
//    
//    NSString *savePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//    
//    [manager fileDownload:url savePath:savePath progress:^(int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
//        
//        NSLog(@"%f",(float)totalBytesWritten/totalBytesExpectedToWrite);
//        
//    } complete:^(NSString * _Nullable filePath, NSError * _Nullable error) {
//        
//        NSLog(@"%@---error:%@",filePath,error);
//        
////        self.manager = nil;
//        
//    }];
    
//    [ZHHttpManager currentReachability:^(AFNetworkReachabilityStatus status) {
//       
//        switch (status) {
//                
//            case AFNetworkReachabilityStatusNotReachable:
//                NSLog(@"没有网络");
//                break;
//                
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//                NSLog(@"移动网络");
//                break;
//
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//                NSLog(@"wifi网络");
//                break;
//
//            default:
//                NSLog(@"未知网络");
//                break;
//        }
//        
//    }];
    
//    ZHHttpManager *manager = [[ZHHttpManager alloc] init];
//    self.manager = manager;
//    [manager startMonitorReachability];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkChange:) name:@"kReachabilityStatusChange" object:nil];
    
    
}

- (void)networkChange:(NSNotification *)noti {
    NSLog(@"%@",noti.object);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.manager stopMonitorReachability];
    self.manager = nil;
}



@end
