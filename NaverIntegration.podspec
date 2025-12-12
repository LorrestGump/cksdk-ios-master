Pod::Spec.new do |s|
  s.name            = "NaverIntegration"
  s.version         = "2.0.0"
  s.summary         = "NaverIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = false
  s.source          = { 
     http: "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.0.0/NaverFramework.zip",
     sha256: "6f4afd78dabec2834287e12ea1e79e6a820204eb2d556eff1445e4c68ebf3a72"
  }
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']
  s.ios.vendored_frameworks   = [
    'NaverFramework/NaverIntegration.xcframework',
    'NaverFramework/NaverGame-1.3.12/NaverLogin-4.2.3/NaverThirdPartyLogin.xcframework',
    'NaverFramework/NaverGame-1.3.12/NNGSDK/NNGSDK.xcframework'
  ]
  s.dependency 'CKSDKProtocalKit'

end
