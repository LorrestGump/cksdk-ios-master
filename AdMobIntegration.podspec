Pod::Spec.new do |s|
  s.name            = "AdMobIntegration"
  s.version         = "2.0.2"
  s.summary         = "AdMobIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = false
  s.source          = { 
     http: "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.0.2/AdMobIntegration.xcframework.zip",
     sha256: "23ac500ec16da20ff56f46f2c7f5cd196727f609bc14e7e99cf75241df3c6b12"
  }
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']
  s.ios.vendored_frameworks   = 'AdMobIntegration.xcframework'
  s.dependency 'CKSDKProtocalKit'
  s.dependency 'Google-Mobile-Ads-SDK'
  s.dependency 'GoogleUserMessagingPlatform'
  
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '$(inherited) -lc++ -ObjC',
  }

end
