Pod::Spec.new do |s|
  s.name            = "CKSDKCore"
  s.version         = "2.0.0"
  s.summary         = "CKSDKCore iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => ''}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = true
  # s.source          = { 
  #    http: "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.0.0/CKSDKCore.xcframework.zip",
  #    sha256: "4499ab0ddcb2da41806a5355227e5b24dc3a72ea0f83d6ec437fb94dff30e067"
  # }
  s.source = {
    :git => 'https://github.com/LorrestGump/cksdk-ios-master.git',
    :tag => s.version.to_s,
  }
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit', 'AdServices', 'AdSupport']
  s.vendored_frameworks   = 'CKSDKCore.xcframework'
  s.dependency 'CKSDKCore/ProtocalKit'

  s.subspec 'ProtocalKit' do |a|
    a.source_files        = 'CKSDKProtocalKit/**/*.{h,m,swift}'
    a.public_header_files = 'CKSDKProtocalKit/**/*.h'
    a.frameworks          = 'Foundation', 'UIKit'
    a.requires_arc        = true
    
  end

  s.subspec 'AppsFlyerIntegration' do |a|
    a.source_files        = 'AppsFlyerIntegration/**/*.{h,m,swift}'
    a.public_header_files = 'AppsFlyerIntegration/**/*.h'
    a.dependency 'CKSDKCore/ProtocalKit'
    # a.dependency 'AppsFlyerFramework'
    a.vendored_xcframeworks = 'AppsFlyerIntegration/AppsFlyerLib.xcframework'
    a.frameworks          = 'Foundation', 'UIKit'
    a.requires_arc        = true
    a.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  # s.subspec 'AdMobIntegration' do |a|
  #   a.source_files        = 'AdMobIntegration/**/*.{h,m,swift}'
  #   a.public_header_files = 'AdMobIntegration/**/*.h'
  #   a.dependency 'CKSDKCore/ProtocalKit'
  #   a.dependency 'Google-Mobile-Ads-SDK', 'GoogleUserMessagingPlatform'
  #   a.frameworks          = 'Foundation', 'UIKit'
  #   a.requires_arc        = true
  #   a.user_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  # end

  # s.subspec 'FirebaseIntegration' do |a|
  #   a.source_files        = 'FirebaseIntegration/**/*.{h,m,swift}'
  #   a.public_header_files = 'FirebaseIntegration/**/*.h'
  #   a.dependency 'CKSDKCore/ProtocalKit'
  #   a.dependency 'FirebaseAnalytics', 'FirebaseMessaging'
  #   a.frameworks          = 'Foundation', 'UIKit'
  #   a.requires_arc        = true
  #   a.user_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  # end

  # s.subspec 'FacebookIntegration' do |a|
  #   a.source_files        = 'FacebookIntegration/**/*.{h,m,swift}'
  #   a.public_header_files = 'FacebookIntegration/**/*.h'
  #   a.dependency 'CKSDKCore/ProtocalKit'
  #   a.dependency 'FBAEMKit', 'FBSDKCoreKit', 'FBSDKGamingServicesKit', 'FBSDKLoginKit', 'FBSDKShareKit'
  #   a.frameworks          = 'Foundation', 'UIKit'
  #   a.requires_arc        = true
  #   a.user_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  # end

  s.subspec 'TwitterIntegration' do |a|
    a.source_files        = 'TwitterIntegration/**/*.{h,m,swift}'
    a.public_header_files = 'TwitterIntegration/**/*.h'
    a.dependency 'CKSDKCore/ProtocalKit'
    # a.dependency 'TwitterKit5'
    a.vendored_frameworks = 'TwitterIntegration/TwitterKit.framework', 'TwitterIntegration/TwitterCore.framework'
    a.frameworks          = 'Foundation', 'UIKit'
    a.requires_arc        = true
    a.pod_target_xcconfig = {
      # 关键：动态库运行时路径
      'LD_RUNPATH_SEARCH_PATHS' => '@executable_path/Frameworks',
      # 禁用静态链接检查
      'OTHER_LDFLAGS' => '-undefined dynamic_lookup'
    }
  end

  # s.subspec 'VKIntegration' do |a|
  #   a.source_files        = 'VKIntegration/**/*.{h,m,swift}'
  #   a.public_header_files = 'VKIntegration/**/*.h'
  #   a.dependency 'CKSDKCore/ProtocalKit'
  #   a.dependency 'VKID', '~> 2.2'
  #   a.frameworks          = 'Foundation', 'UIKit'
  #   a.requires_arc        = true
  #   a.user_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  # end

end
