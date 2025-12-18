Pod::Spec.new do |s|
  s.name            = "AppsFlyerIntegration"
  s.version         = "2.0.2"
  s.summary         = "AppsFlyerIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = true
  s.source          = { 
     http: "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.0.2/AppsFlyerIntegration.xcframework.zip",
     sha256: "eea05e08225d4dc59ebb1966db9621255e1c82aa9b1ca8dc494431d8e87f7850"
  }
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']
  s.ios.vendored_frameworks   = 'AppsFlyerIntegration.xcframework'
  s.dependency 'CKSDKProtocalKit'
  s.dependency 'AppsFlyerFramework'
end
