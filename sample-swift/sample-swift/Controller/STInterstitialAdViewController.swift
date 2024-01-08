//
//  STInterstitialAdViewController.swift
//  sample-swift
//
//  Created by Jaeuk Jeong on 12/15/23.
//

import UIKit
import SantaSDK

class STInterstitialAdViewController: UIViewController {

    @IBOutlet var textKeyword: UITextField!
    @IBOutlet var btnLoadAd: UIButton!
    @IBOutlet var btnShowAd: UIButton!

    var info: STAdInfoModel?
    var interstitial: STInterstitialAdView?

    override func viewDidLoad() {
        super.viewDidLoad()

        textKeyword.text = info?.ID
    }
}

extension STInterstitialAdViewController {
    @IBAction func loadAdClick(_ sender: UIButton) {

        self.textKeyword.resignFirstResponder()

        self.btnShowAd.isEnabled = true

        if let adUnitId = textKeyword.text {
            self.interstitial = STInterstitialAdView.interstitialAdControllerForAdUnitId(adUnitId)

            if let interstitial = interstitial {
                interstitial.delegate = self        // 대리자 전달
                interstitial.adFormat = [.HTML]     // 광고 포맷 선택 (adFormat: [SantaSDK.STAdFormat]?)
                interstitial.testing = true         // 광고 테스트 여부
                interstitial.loadAd()
            }
        }
    }

    @IBAction func showAdClick(_ sender: UIButton) {
        self.interstitial?.showFromViewController(self)
    }
}

extension STInterstitialAdViewController: STInterstitialAdViewDelegate {
    /**
     * 전면 광고를 성공적으로로드하면 전송됩니다.
     */
    func interstitialDidLoadAd(_ interstitial: SantaSDK.STInterstitialAdView?) {
        print("interstitialDidLoadAd")
    }

    /**
     * 광고를로드하지 못할 때 전송됩니다..
     */
    func interstitialDidFailToLoadAd(_ interstitial: SantaSDK.STInterstitialAdView?) {
        print("interstitialDidFailToLoadAd")

    }

    /**
     * 전면 광고가 화면에 표시되기 직전에 전송됩니다.
     */
    func interstitialWillAppear(_ interstitial: SantaSDK.STInterstitialAdView?) {
        print("interstitialWillAppear")
    }

    /**
     * 전면 광고가 화면에 표시된 후에 전송됩니다.
     */
    func interstitialDidAppear(_ interstitial: SantaSDK.STInterstitialAdView?) {
        print("interstitialDidAppear")
    }

    /**
     * 전면 광고가  화면에 표시되지 못할때
     */
    func interstitialDidFailToShow(_ interstitial: SantaSDK.STInterstitialAdView?) {
        print("interstitialDidFailToShow")
    }

    /**
     * 전면 광고가  화면에서 닫히기 직전에 전송됩니다.
     */
    func interstitialWillDisappear(_ interstitial: SantaSDK.STInterstitialAdView?) {
        print("interstitialWillDisappear")
    }

    /**
     * 전면 광고가 화면에서 해제 된 후 전송되어 애플리케이션에 제어권이 반환됩니다.
     */
    func interstitialDidDisappear(_ interstitial: SantaSDK.STInterstitialAdView?) {
        print("interstitialDidDisappear")
    }

    /**
     * 로드 된 전면 광고를 더 이상 표시 할 수 없을 때 전송됩니다.
     */
    func interstitialDidExpire(_ interstitial: SantaSDK.STInterstitialAdView?) {
        print("interstitialDidExpire")
    }

    /**
     * 사용자가 전면 광고를 탭하고 광고가 타겟 작업을 수행하려고 할 때 전송됩니다.
     */
    func interstitialDidReceiveTapEvent(_ interstitial: SantaSDK.STInterstitialAdView?) {
        print("interstitialDidReceiveTapEvent")
    }
}
