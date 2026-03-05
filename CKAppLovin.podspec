Pod::Spec.new do |s|
  s.name            = "CKAppLovin"
  s.version         = "2.1"
  s.summary         = "CKAppLovin iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios, '12.0'
  s.swift_version   = '5.0'
  # s.static_framework = true
  
  s.source          = { 
     :http => "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.1/CKAppLovin.zip",
     :sha256 => "15153b078e2f5b39fa52568a4ce34c1761a82b8910db96e2af87738f66ed0867"
  }

  # s.ios.frameworks        = ['Foundation', 'UIKit']
  s.ios.vendored_frameworks   = [
    'CKAppLovin/13.5.1/AppLovinSDK.xcframework'
  ]

end
