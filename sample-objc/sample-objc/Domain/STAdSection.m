//
//  STAdSection.m
//  santa-ios-sdk-sample-obj
//
//  Created by Jaeuk Jeong on 1/30/24.
//

#import "STAdSection.h"
#import "STAdInfo.h"

@interface STAdSection ()

@property (nonatomic, strong) NSArray *ads;

@end

@implementation STAdSection

+ (NSArray *)adSections
{
    return @[
             [STAdSection sectionWithTitle:@"Banner Ads" ads:[STAdInfo bannerAds]],
             [STAdSection sectionWithTitle:@"Native Ads" ads:[STAdInfo nativeAds]]
             ];
}

+ (STAdSection *)sectionWithTitle:(NSString *)title ads:(NSArray *)ads
{
    STAdSection *section = [[STAdSection alloc] init];
    section.title = title;
    section.ads = ads;
    return section;
}

- (STAdInfo *)adAtIndex:(NSUInteger)index
{
    return [self.ads objectAtIndex:index];
}

- (NSUInteger)count
{
    return [self.ads count];
}

@end
