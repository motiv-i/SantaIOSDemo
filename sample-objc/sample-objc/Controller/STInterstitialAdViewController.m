//
//  STInterstitialAdViewController.m
//  santa-ios-sdk-sample-obj
//
//  Created by Jaeuk Jeong on 1/30/24.
//

#import "STInterstitialAdViewController.h"
#import <SantaSDK/SantaSDK-Swift.h>

@interface STInterstitialAdViewController ()<STInterstitialAdViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textKeyword;
@property (weak, nonatomic) IBOutlet UIButton *btnLoadAd;
@property (weak, nonatomic) IBOutlet UIButton *btnShowAd;

@property (nonatomic, strong) STInterstitialAdView *interstitial;
@property (nonatomic, strong) NSEnumerator<NSString *> *mediations;

@end

@implementation STInterstitialAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.textKeyword.text = self.info.ID;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapLoadButton:(id)sender
{
    [self.textKeyword endEditing:YES];

    self.btnShowAd.hidden = NO;

    self.interstitial = [STInterstitialAdView interstitialAdControllerForAdUnitId:self.textKeyword.text];

    self.interstitial.delegate = self;
    self.interstitial.testing = YES;
    [self.interstitial loadAd];
}

- (IBAction)didTapShowButton:(id)sender
{
    [self.interstitial showFromViewController:self];
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

#pragma mark - <EBInterstitialAdControllerDelegate>

- (void)interstitialDidLoadAd:(STInterstitialAdView *)interstitial
{
}

- (void)interstitialDidFailToLoadAd:(STInterstitialAdView *)interstitial
{
}

- (void)interstitialDidExpire:(STInterstitialAdView *)interstitial
{
    self.btnShowAd.hidden = YES;
}

- (void)interstitialWillAppear:(STInterstitialAdView *)interstitial
{
}

- (void)interstitialDidAppear:(STInterstitialAdView *)interstitial
{
}

- (void)interstitialWillDisappear:(STInterstitialAdView *)interstitial
{
}

- (void)interstitialDidDisappear:(STInterstitialAdView *)interstitial
{
    self.btnShowAd.hidden = YES;
}

- (void)interstitialDidReceiveTapEvent:(STInterstitialAdView *)interstitial
{
}

- (void)interstitialDidLoadMediation:(NSArray<NSString *> *)mediations
{
    self.mediations = [mediations objectEnumerator];
    [self loadMediation];
}

@end
