Pod::Spec.new do |s|
  s.name            = "AppsFlyerIntegration"
  s.version         = "2.0.0"
  s.summary         = "AppsFlyerIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = false
  s.source          = { 
     http: "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.0.0/AppsFlyerIntegration.xcframework.zip",
     sha256: "48d98a2b4f6d0b303ecbcacef700a273d7a7dbd6b635a375a427fb64de9cc821"
  }
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']
  s.ios.vendored_frameworks   = 'CKSDKProtocalKit.xcframework'
  s.dependency 'CKSDKProtocalKit'

end
