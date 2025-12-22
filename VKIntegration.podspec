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
  s.static_framework = true
  s.source          = { :git => "https://github.com/LorrestGump/cksdk-ios-master.git", :tag => s.version.to_s }
  s.source_files = 'Integrations/VKIntegration/**/*.{h,m,swift}'
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']

  s.dependency 'CKSDKProtocalKit'
  s.dependency 'VKID', '~> 2.2'

  # 推荐：如果您的 OC 代码需要引用 Swift 模块，添加此行
  s.pod_target_xcconfig     = { 'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/VKID' }

end
