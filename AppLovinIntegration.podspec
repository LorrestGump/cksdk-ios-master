Pod::Spec.new do |s|
  s.name            = "AppLovinIntegration"
  s.version         = "2.0.3"
  s.summary         = "FacebookIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = true
  s.source          = { :git => "https://github.com/LorrestGump/cksdk-ios-master.git", :tag => s.version.to_s }
  s.source_files = 'Integrations/AppLovinIntegration/**/*.{h,m,swift}'

  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']
  s.ios.vendored_frameworks   = [
    'Frameworks/applovin-ios-sdk-13.5.1/AppLovinSDK.xcframework'
  ]
  s.dependency 'CKSDKProtocalKit'

  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC'
  }
end
