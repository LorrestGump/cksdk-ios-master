Pod::Spec.new do |s|

  s.name         = "CKSDKCore"
  s.version      = "2.0.0"
  s.summary      = "CKSDKCore iOS SDK"


  s.homepage     = "https://github.com/BestRivenV/cksdk-ios-master"
  s.license      = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.' }
  s.author       = 'YaYaWan'
  s.requires_arc = true
  s.platform     = :ios
  s.swift_version = '5.0'
  s.static_framework = true

  s.source       = { 
      http: "https://github.com/BestRivenV/cksdk-ios-master/releases/download/v2.0.0-beta.1/CKSDKCore.xcframework.zip",
      sha256: "4499ab0ddcb2da41806a5355227e5b24dc3a72ea0f83d6ec437fb94dff30e067"
  }

  s.ios.deployment_target = '12.0'

  s.ios.frameworks = 'AdServices', 'AdSupport'

  s.vendored_frameworks = 'CKSDKCore.xcframework' 


  s.subspec 'AppsFlyerIntegration' do |a|
    a.source_files = 'AppsFlyerIntegration/**/*.{h,m,swift}'
    a.public_header_files = 'AppsFlyerIntegration/**/*.h'
    a.static_framework = true
    a.dependency 'AppsFlyerFramework'
    # 【重点】静态库依赖动态库，必须添加链接标志
    a.user_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
    # 如果 LibraryA 需要额外的 Framework 或配置，都在这里添加
  End



end
