Pod::Spec.new do |s|
  s.name            = "VKIntegration"
  s.version         = "2.0.3"
  s.summary         = "VKIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  # s.static_framework = true
  s.source          = { :git => "https://github.com/LorrestGump/cksdk-ios-master.git", :tag => s.version.to_s }
  s.source_files = 'Integrations/VKIntegration/**/*.{h,m,swift}'
  s.ios.deployment_target = '13.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']

  s.dependency 'CKSDKProtocalKit'
  s.dependency 'VKID', '~> 2.2'

  # s.pod_target_xcconfig = {
  #   # 强制启用 Module Stability
  #   'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES', 
  #   # 确保 Swift 编译器知道去哪里找依赖的模块
  #   'SWIFT_INCLUDE_PATHS' => '$(inherited)', 
  #   # 确保语言版本一致（虽然 s.swift_version 应该已经设置了，但此处冗余设置可提高稳定性）
  #   'SWIFT_VERSION' => '5.0'
  # }

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'SWIFT_INCLUDE_PATHS' => '$(inherited)' }
  s.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }

end
