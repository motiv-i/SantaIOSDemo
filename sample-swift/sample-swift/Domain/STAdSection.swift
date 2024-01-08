//
//  STAdSection.swift
//  SantaSDK_Sample
//
//  Created by Jaeuk Jeong on 12/6/23.
//

import Foundation

struct STAdSection {
    static var shared = STAdSection()
    
    func adSections() -> [STAdSectionModel] {
        return [STAdSectionModel(title: "Banner Ads", ad: STAdInfo.shared.bannerAds()),
                STAdSectionModel(title: "Native Ads", ad: STAdInfo.shared.nativeAds()),
                STAdSectionModel(title: "Etc Ads", ad: STAdInfo.shared.etcAds())]
    }
    
}

