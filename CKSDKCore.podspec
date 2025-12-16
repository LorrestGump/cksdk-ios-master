Pod::Spec.new do |s|
  s.name            = "CKSDKCore"
  s.version         = "2.0.1"
  s.summary         = "CKSDKCore iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = false
  s.source          = { 
     http: "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.0.1/CKSDKCore.xcframework.zip",
     sha256: "4f6f88be32554fe707f5cb4177854cceb4230bb29d47bb83c7b8752759699f7c"
  }
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit', 'AdServices', 'AdSupport']
  s.ios.vendored_frameworks   = 'CKSDKCore.xcframework'
  s.dependency 'CKSDKProtocalKit'

  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC',
  }

end
