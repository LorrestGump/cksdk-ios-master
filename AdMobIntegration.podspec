Pod::Spec.new do |s|
  s.name            = "AdMobIntegration"
  s.version         = "2.0.4"
  s.summary         = "AdMobIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = true
  s.source          = { :git => "https://github.com/LorrestGump/cksdk-ios-master.git", :tag => s.version.to_s }
  s.source_files = 'Integrations/AdMobIntegration/**/*.{h,m,swift}'
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']

  s.dependency 'CKSDKProtocalKit'
  s.dependency 'Google-Mobile-Ads-SDK'
  s.dependency 'GoogleUserMessagingPlatform'

  s.resource_bundles = {
    'AdMobIntegration-Resources' => ['Integrations/AdMobIntegration/Resources/*.{xcassets,lproj,txt,xcprivacy,xcstrings}']
  }
  
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '$(inherited) -lc++ -ObjC',
  }

end
