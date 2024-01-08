//
//  STAdInfo.swift
//  SantaSDK_Sample
//
//  Created by Jaeuk Jeong on 12/5/23.
//

import Foundation

struct STAdInfo {
    static var shared = STAdInfo()
    
    func bannerAds() -> [STAdInfoModel] {
        return [
            STAdInfoModel(title: "배너 광고", ID: "unit-6576b33cd9c2d24f207bd3b8", type: .Banner),
            STAdInfoModel(title: "전면배너 광고", ID: "unit-6576b5c455c2ef6dc03c3607", type: .Interstitial)
        ]
    }
    
    func nativeAds() -> [STAdInfoModel] {
        return [
            STAdInfoModel(title: "네이티브 광고", ID: "unit-6576b5e1b370964bc86606dd", type: .Native),
        ]
    }
    
    func etcAds() -> [STAdInfoModel] {
        
        return [
        ]
    }
}

