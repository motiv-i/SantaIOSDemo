//
//  STAdInfo.m
//  santa-ios-sdk-sample-obj
//
//  Created by Jaeuk Jeong on 1/30/24.
//

#import "STAdInfo.h"
#import <UIKit/UIKit.h>

@implementation STAdInfo

+ (NSDictionary *)supportedAddedAdTypes
{
    static NSDictionary *adTypes = nil;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        adTypes = @{@"Banner":@(STAdInfoBanner), @"Native":@(STAdInfoNative)};
    });
    
    return adTypes;
}

+ (NSArray *)bannerAds
{
    NSMutableArray *ads = [NSMutableArray array];
    
    [ads addObjectsFromArray:@[
                               [STAdInfo infoWithTitle:@"배너 광고" ID:@"unit-6576b33cd9c2d24f207bd3b8" type:STAdInfoBanner],
                               [STAdInfo infoWithTitle:@"전면배너 광고" ID:@"unit-6576b5c455c2ef6dc03c3607" type:STAdInfoInterstitial]]];
    
    return ads;
}

+ (NSArray *)nativeAds
{
    return @[
        [STAdInfo infoWithTitle:@"네이티브 광고" ID:@"unit-6576b5e1b370964bc86606dd" type:STAdInfoNative]
    ];
}

+ (STAdInfo *)infoWithTitle:(NSString *)title ID:(NSString *)ID type:(STAdInfoType)type
{
    STAdInfo *info = [[STAdInfo alloc] init];
    info.title = title;
    info.ID = ID;
    info.type = type;
    return info;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self != nil)
    {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.ID = [aDecoder decodeObjectForKey:@"ID"];
        self.type = [aDecoder decodeIntegerForKey:@"type"];
        self.keywords = [aDecoder decodeObjectForKey:@"keywords"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.ID forKey:@"ID"];
    [aCoder encodeInteger:self.type forKey:@"type"];
    [aCoder encodeObject:((self.keywords != nil) ? self.keywords : @"") forKey:@"keywords"];
}


@end
