//
//  Models.swift
//  SantaSDK_Sample
//
//  Created by Jaeuk Jeong on 12/5/23.
//

import Foundation

struct STAdInfoModel: Identifiable {
    var id = UUID()
    var title: String
    var ID: String
    var type: EBAdInfoType = .Banner
    var keyWord: String?
    
    enum EBAdInfoType {
        case Banner, Interstitial, Native
    }
}


struct STAdSectionModel: Identifiable {
    var id = UUID();
    var title: String
    var ad: [STAdInfoModel]
    
    func adAtIndex(_ idx: Int) -> STAdInfoModel {
        return ad[idx]
    }
    
    func count() -> Int {
        return ad.count
    }
}
