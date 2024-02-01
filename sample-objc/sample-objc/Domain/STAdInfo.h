//
//  STAdInfo.h
//  santa-ios-sdk-sample-obj
//
//  Created by Jaeuk Jeong on 1/30/24.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, STAdInfoType) {
    STAdInfoBanner,
    STAdInfoInterstitial,
    STAdInfoNative
};

@interface STAdInfo : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, assign) STAdInfoType type;
@property (nonatomic, copy) NSString *keywords;

+ (NSArray *)bannerAds;
+ (NSArray *)nativeAds;
+ (STAdInfo *)infoWithTitle:(NSString *)title ID:(NSString *)ID type:(STAdInfoType)type;
+ (NSDictionary *)supportedAddedAdTypes;

@end
