Pod::Spec.new do |s|
  s.name            = "FirebaseIntegration"
  s.version         = "2.0.0"
  s.summary         = "FirebaseIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = false
  s.source          = { 
     http: "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.0.0/FirebaseIntegration.xcframework.zip",
     sha256: "71c6c84421c23c2aa33a2b57da06e8b93fc5de255af3f88509c45f546f051675"
  }
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']
  s.ios.vendored_frameworks   = 'FirebaseIntegration.xcframework'
  s.dependency 'CKSDKProtocalKit'
  s.dependency 'FirebaseAnalytics'
  s.dependency 'FirebaseMessaging'

end
