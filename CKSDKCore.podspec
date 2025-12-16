Pod::Spec.new do |s|
  s.name            = "CKSDKCore"
  s.version         = "2.0.0"
  s.summary         = "CKSDKCore iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.dynamic_framework = true
  s.static_framework = false
  s.source          = { 
     http: "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.0.0/CKSDKCore.xcframework.zip",
     sha256: "78ab25757bf4d14c7404f0470b9524baccdac6ff88bac7547d0b985d194a8588"
  }
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit', 'AdServices', 'AdSupport']
  s.ios.vendored_frameworks   = 'CKSDKCore.xcframework'
  s.dependency 'MBProgressHUD'
  s.dependency 'CKSDKProtocalKit'

  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC'
  }

end
