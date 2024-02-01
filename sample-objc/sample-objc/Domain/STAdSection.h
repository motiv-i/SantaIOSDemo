//
//  STAdSection.h
//  santa-ios-sdk-sample-obj
//
//  Created by Jaeuk Jeong on 1/30/24.
//

#import <Foundation/Foundation.h>

@class STAdInfo;

@interface STAdSection : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign, readonly) NSUInteger count;

+ (NSArray *)adSections;
+ (STAdSection *)sectionWithTitle:(NSString *)title ads:(NSArray *)ads;

- (STAdInfo *)adAtIndex:(NSUInteger)index;

@end

