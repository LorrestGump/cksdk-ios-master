Pod::Spec.new do |s|

  s.name         = "CKSDKCore"
  s.summary      = "CKSDKCore iOS SDK"
  s.homepage     = "https://github.com/BestRivenV/cksdk-ios-master"
  s.license      = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.' }
  s.author       = 'YaYaWan'
  s.requires_arc = true
  s.platform     = :ios
  s.swift_version = '5.0'
  s.static_framework = true

  s.version      = "2.0.0"
  s.source       = { 
    # 必须包含 Git 信息，这样 pod spec lint 才能克隆源码
    :git => 'https://github.com/BestRivenV/cksdk-ios-master.git', 
    :tag => s.version.to_s,
  }

  s.ios.deployment_target = '12.0'
  s.ios.frameworks = 'AdServices', 'AdSupport'
  s.vendored_frameworks = 'CKSDKCore.xcframework' 


  s.subspec 'ProtocalKit' do |a| 
    a.source_files = 'CKSDKProtocalKit/**/*.{h,m,swift}'
    a.public_header_files = 'CKSDKProtocalKit/**/*.h'
  end

  s.subspec 'AppsFlyerIntegration' do |a|
    a.source_files = 'AppsFlyerIntegration/**/*.{h,m,swift}'
    a.public_header_files = 'AppsFlyerIntegration/**/*.h'
    a.dependency 'CKSDKCore/ProtocalKit'
    a.dependency 'AppsFlyerFramework'
    a.user_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

end
