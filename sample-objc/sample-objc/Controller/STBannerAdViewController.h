//
//  STBannerAdViewController.h
//  santa-ios-sdk-sample-obj
//
//  Created by Jaeuk Jeong on 1/30/24.
//

#import <UIKit/UIKit.h>
#import "STAdInfo.h"

@interface STBannerAdViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *adViewContainer;

@property (nonatomic, strong) STAdInfo *info;

@end
