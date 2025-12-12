Pod::Spec.new do |s|
  s.name            = "VKIntegration"
  s.version         = "2.0.0"
  s.summary         = "VKIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = false
  s.source          = { 
     http: "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.0.0/VKIntegration.xcframework.zip",
     sha256: "57c3df2638674433be6b096dc3e3fc2d9223fe9c6238dec9da084711ba57a217"
  }
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']
  s.ios.vendored_frameworks   = 'VKIntegration.xcframework'
  s.dependency 'CKSDKProtocalKit'
  s.dependency 'VKID', '~> 2.2'


end
