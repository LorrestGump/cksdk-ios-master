Pod::Spec.new do |s|

  s.name         = "CKSDKCore"
  s.version      = "2.0.0"
  s.summary      = "CKSDKCore iOS SDK"

  s.homepage     = "http://github.com/LorrestGump/cksdk-ios-master"

  s.license      = { :type => 'Proprietary', :text => ''}
  s.author       = 'YaYaWan'
  s.requires_arc = true
  s.platform     = :ios
  s.swift_version = '5.0'
  s.static_framework = true

  # s.source       = {
  #   :git => 'https://github.com/BestRivenV/cksdk-ios-master.git',
  #   :tag => s.version.to_s,
  # }
  s.source       = { 
     http: "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.0.0/CKSDKCore.xcframework.zip",
     sha256: "4499ab0ddcb2da41806a5355227e5b24dc3a72ea0f83d6ec437fb94dff30e067"
  }

  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['AdServices', 'AdSupport']
  s.vendored_frameworks   = 'CKSDKCore.xcframework'

  # s.subspec 'ProtocalKit' do |a|
  #   a.source_files        = 'CKSDKProtocalKit/**/*.{h,m,swift}'
  #   a.public_header_files = 'CKSDKProtocalKit/**/*.h'
  # end

  # s.subspec 'AppsFlyerIntegration' do |a|
  #   a.source_files        = 'AppsFlyerIntegration/**/*.{h,m,swift}'
  #   a.public_header_files = 'AppsFlyerIntegration/**/*.h'
  #   a.dependency 'CKSDKCore/ProtocalKit'
  #   a.dependency 'AppsFlyerFramework'
  # #  a.user_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  # end

end
