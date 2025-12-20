Pod::Spec.new do |s|
  s.name            = "FirebaseIntegration"
  s.version         = "2.0.2"
  s.summary         = "FirebaseIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = false
  s.source          = { 
     http: "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.0.2/FirebaseIntegration.xcframework.zip",
     sha256: "c46f14ae6cbfd0f410dc407fe4afbabf8376d9934523a4355f042605ac2b5690"
  }
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']
  s.ios.vendored_frameworks   = 'FirebaseIntegration.xcframework'
  s.dependency 'CKSDKProtocalKit'
  s.dependency 'FirebaseAnalytics'
  s.dependency 'FirebaseMessaging'

end
