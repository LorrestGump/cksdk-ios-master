Pod::Spec.new do |s|
  s.name            = "TwitterIntegration"
  s.version         = "2.0.0"
  s.summary         = "TwitterIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = false
  s.source          = { 
     http: "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.0.0/TwitterIntegration.framework.zip",
     sha256: "64e0d75bfb84fccad8e27002a536ad0b2ae9bf127e4f7b47752a8d35d1fc91a8"
  }
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']
  s.ios.vendored_frameworks   = 'TwitterIntegration.framework'
  s.dependency 'CKSDKProtocalKit'
  s.dependency 'TwitterKit5'

  # 关键配置
  s.pod_target_xcconfig = {
    'ARCHS[sdk=iphonesimulator*]' => '$(ARCHS_STANDARD_64_BIT)',  # 不要设为空
    'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64 arm64',       # 明确指定模拟器支持的架构
    'ARCHS[sdk=iphoneos*]' => 'arm64',
    'VALID_ARCHS' => 'arm64 armv7 x86_64',
    'ONLY_ACTIVE_ARCH' => 'YES'
  }
  
end
