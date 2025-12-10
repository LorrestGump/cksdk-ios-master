Pod::Spec.new do |s|

  s.name         = "CKSDKCore"
  
  s.summary      = "CKSDKCore iOS SDK"


  s.homepage     = "https://github.com/BestRivenV/cksdk-ios-master"
  s.license      = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.' }
  s.author       = 'YaYaWan'
  s.requires_arc = true
  s.platform     = :ios
  s.swift_version = '5.0'
  # 一旦设置主库，所有子库都会和主库统一，不能混合静态库和动态库
  s.static_framework = true

  s.version      = "2.0.0"
  s.source       = { 
    # 必须包含 Git 信息，这样 pod spec lint 才能克隆源码
    :git => 'https://github.com/BestRivenV/cksdk-ios-master.git', 
    :tag => s.version.to_s,
  
    # 如果您仍然需要通过 HTTP URL 下载预编译文件，可以保持 vendored_frameworks 不变，
    # 但对于源码验证，Git 信息是必需的。
  }
#  s.source       = { 
#      http: "https://github.com/BestRivenV/cksdk-ios-master/releases/download/v2.0.0-beta.1/CKSDKCore.xcframework.zip",
#      sha256: "4499ab0ddcb2da41806a5355227e5b24dc3a72ea0f83d6ec437fb94dff30e067"
#  }


  s.ios.deployment_target = '12.0'

  s.ios.frameworks = 'AdServices', 'AdSupport'

  s.vendored_frameworks = 'CKSDKCore.xcframework' 


  s.subspec 'ProtocalKit' do |a| # 使用更简洁的名称，如 'ProtocolKit'
    a.source_files = 'CKSDKProtocalKit/**/*.{h,m,swift}'
    a.public_header_files = 'CKSDKProtocalKit/**/*.h'
    # 注意：不需要再次设置 a.static_framework，它会继承主规格的设置。
  end

  s.subspec 'AppsFlyerIntegration' do |a|
    a.source_files = 'AppsFlyerIntegration/**/*.{h,m,swift}'
    a.public_header_files = 'AppsFlyerIntegration/**/*.h'
    
    # 核心设置 1: 依赖同一个 Podspec 中的另一个 Subspec
    # 格式为 'PodName/SubspecName'。如果 Subspec 与主 Pod 同名，可以简写。
    # 这里是 'CKSDKCore/ProtocalKit'
    a.dependency 'CKSDKCore/ProtocalKit'

    a.dependency 'AppsFlyerFramework'
    # 【重点】静态库依赖动态库，必须添加链接标志
    a.user_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
    # 如果 LibraryA 需要额外的 Framework 或配置，都在这里添加
  end



end
