Pod::Spec.new do |s|
  s.name            = "AppsFlyerIntegration"
  s.version         = "2.0.4"
  s.summary         = "AppsFlyerIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = true
  s.source          = { :git => "https://github.com/LorrestGump/cksdk-ios-master.git", :tag => s.version.to_s }
  s.source_files = 'Integrations/AppsFlyerIntegration/**/*.{h,m,swift}'  
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']

  s.dependency 'CKSDKProtocalKit'
  s.dependency 'AppsFlyerFramework'

  spec.resource_bundles = {
    'AppsFlyerIntegration-Resources' => ['Integrations/AppsFlyerIntegration/Resources/*.{xcassets,lproj,txt,xcprivacy,xcstrings}']
  }

  # s.pod_target_xcconfig     = { 'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/VKID' }
end
