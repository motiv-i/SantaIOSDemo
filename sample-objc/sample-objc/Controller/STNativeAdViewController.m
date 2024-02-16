//
//  STNativeAdViewController.m
//  santa-ios-sdk-sample-obj
//
//  Created by Jaeuk Jeong on 1/30/24.
//

#import "STNativeAdViewController.h"
#import "STNAtiveAdView.h"
#import <SantaSDK/SantaSDK-Swift.h>

@interface STNativeAdViewController ()<STNativeAdDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textKeyword;
@property (weak, nonatomic) IBOutlet UIButton *btnLoadAd;

@property (nonatomic, strong) STNativeAd *nativeAd;
@property (nonatomic, strong) NSEnumerator<NSString *> *mediations;


@end

@implementation STNativeAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.textKeyword.text = self.info.ID;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loadAdClicked:(id)sender
{
    [self.textKeyword endEditing:YES];

    [self clearAd];

    // Create and configure a renderer configuration for native ads.
    
    [STNativeAdManager initNativeAdWithAdUnitIdentifier:self.textKeyword.text :[STNativeAdView class]];
    [STNativeAdManager coppa:@"0"];
    [STNativeAdManager testing:YES];
    
    [STNativeAdManager startWithCompletionHandler:^(STNativeAdRequest *request, STNativeAd *response, NSError *error) {
        if (error) {
            if (request.mediations) {
                self.mediations = [request.mediations objectEnumerator];
                [self loadMediation];
            }
            [self configureAdLoadFail];
        } else {
            self.nativeAd = response;
            self.nativeAd.delegate = self;
            [self displayAd];
            NSLog(@"Received Native Ad");
        }
    }];

}

- (void)clearAd
{
    [[self.adViewContainer subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.nativeAd = nil;
}

- (void)displayAd
{
    // adViewContainer 내 subview들을 제거
    [[self.adViewContainer subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // 광고뷰 가져오기 및 adViewContainer에 추가
    UIView *adView = [self.nativeAd retrieveAdViewWithError:nil];
    [self.adViewContainer addSubview:adView];
    adView.frame = self.adViewContainer.bounds;
}

- (void)configureAdLoadFail
{
}

- (void)loadMediation
{
    // 미디에이션 목록이 존재할때
    if (self.mediations != nil) {
        // 미디에이션 목록을 순차로 가져온다
        NSString *mediation = [self.mediations nextObject];
        
        NSLog(@"loadMediation = %@", mediation);
        
        // 미디에이션이 비어있다면 목록을 모두 순회함
        if (mediation != nil) {
            if ([mediation isEqual: @"Mediation Name"]) {
                // 사용할 미이데이션에 맞는 광고 호출 코드를 작성
            }
        } else {
            NSLog(@"Mediation is Empty");
        }
    } else {
        NSLog(@"Mediation is Empty");
    }
}

#pragma mark - UITextFieldDelegate


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField endEditing:YES];
    
    return YES;
}

#pragma mark - EBNativeAdDelegate

- (void)willLoadForNativeAd:(STNativeAd *)nativeAd
{
    NSLog(@"Will Load for native ad.");
}

- (void)didLoadForNativeAd:(STNativeAd *)nativeAd
{
    NSLog(@"Did Load for native ad.");
}

- (void)willLeaveApplicationFromNativeAd:(STNativeAd *)nativeAd
{
    NSLog(@"Will leave application from native ad.");
}

- (UIViewController *)viewControllerForPresentingModalView
{
    return self;
}

@end
