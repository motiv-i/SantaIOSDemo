Pod::Spec.new do |s|
    s.name = 'SantaSDK'
    s.version = '1.0.3'
    s.summary = 'SantaSDK'
    s.description = 'SantaSDK for Publisher'
    s.homepage = 'https://github.com/motiv-i/SantaIOSDemo'
    s.license = {
        :type => 'commercial',
        :text => 'Copyright 2014. Motivintelligence, Inc. All rights reserved.'
    }
    s.author = {
        'Motiv Intelligence' => 'dev@motiv-i.com'
    }

    s.source = {
        :git => 'https://github.com/motiv-i/SantaIOSDemo.git',
        :tag => '1.0.3'
    }

    s.platforms = {
        'ios' => '12.0'
    }

    s.ios.deployment_target = '12.0'
    s.ios.vendored_frameworks = 'xcframework/SantaSDK.xcframework'

    s.framework  = 'Foundation', 'UIKit', 'SystemConfiguration', 'AdSupport', 'AppTrackingTransparency', 'StoreKit', 'CoreGraphics', 'CoreTelephony'
end
