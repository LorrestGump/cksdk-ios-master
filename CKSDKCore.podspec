#
#  Be sure to run `pod spec lint CKSDKCore.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "CKSDKCore"
  s.version      = "2.0.0"
  s.summary      = "CKSDKCore iOS SDK"

  s.homepage     = "http://github.com/BestRivenV/cksdk-ios-master"

  s.license      = { :type => 'Proprietary', :text => ''}
  s.author       = 'YaYaWan'
  s.requires_arc = true
  s.platform     = :ios
  s.swift_version = '5.0'
  s.static_framework = true

  s.source       = {
    :git => 'https://github.com/BestRivenV/cksdk-ios-master.git',
    :tag => s.version.to_s,
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
