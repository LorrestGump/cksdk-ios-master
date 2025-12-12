Pod::Spec.new do |s|
  s.name            = "FacebookIntegration"
  s.version         = "2.0.0"
  s.summary         = "FacebookIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = false
  s.source          = { 
     http: "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.0.0/FacebookIntegration.xcframework.zip",
     sha256: "b9dc85d0849785522d0f052462e4a437b75fbef86f3fca237f5ac1d2bd684d9b"
  }
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']
  s.ios.vendored_frameworks   = 'FacebookIntegration.xcframework'
  s.dependency 'CKSDKProtocalKit'
  s.dependency 'FBAEMKit'
  s.dependency 'FBSDKCoreKit'
  s.dependency 'FBSDKGamingServicesKit'
  s.dependency 'FBSDKLoginKit'
  s.dependency 'FBSDKShareKit'

end
