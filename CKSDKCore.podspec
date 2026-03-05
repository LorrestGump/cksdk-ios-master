Pod::Spec.new do |s|
  s.name            = "CKSDKCore"
  s.version         = "2.1"
  s.summary         = "CKSDKCore iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios, '14.0'
  s.swift_version   = '5.0'
  s.static_framework = true
  
  s.source          = { 
     :http => "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.1/CKSDKCore.xcframework.zip",
     :sha256 => "0d67770923c38e8a02bbb64ad893b2ab76f0410626078416431f3e00a259ca24"
  }

  s.ios.frameworks        = ['Foundation', 'UIKit', 'AdServices', 'AdSupport']
  s.ios.vendored_frameworks   = 'CKSDKCore.xcframework'

  s.pod_target_xcconfig = {
	'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }
end
