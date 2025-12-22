Pod::Spec.new do |s|
  s.name            = "NaverIntegration"
  s.version         = "2.0.3"
  s.summary         = "NaverIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = true
  s.source          = { :git => "https://github.com/LorrestGump/cksdk-ios-master.git", :tag => s.version.to_s }
  s.source_files = 'Integrations/NaverIntegration/**/*.{h,m,swift}'
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']
  s.ios.vendored_frameworks   = [
    'Frameworks/NaverGame-1.3.12/NaverLogin-4.2.3/NaverThirdPartyLogin.xcframework',
    'Frameworks/NaverGame-1.3.12/NNGSDK/NNGSDK.xcframework'
  ]
  s.dependency 'CKSDKProtocalKit'

  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC -lc++',
  }

end
