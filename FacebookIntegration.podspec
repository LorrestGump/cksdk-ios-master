Pod::Spec.new do |s|
  s.name            = "FacebookIntegration"
  s.version         = "2.0.4"
  s.summary         = "FacebookIntegration iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = true
  s.source          = { :git => "https://github.com/LorrestGump/cksdk-ios-master.git", :tag => s.version.to_s }
  s.source_files = 'Integrations/FacebookIntegration/**/*.{h,m,swift}'
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']

  s.resource_bundles = {
    'FacebookIntegration-Resources' => ['Integrations/FacebookIntegration/Resources/*.{xcassets,lproj,txt,xcprivacy,xcstrings}']
  }

  s.dependency 'CKSDKProtocalKit'
  s.dependency 'FBAEMKit'
  s.dependency 'FBSDKCoreKit'
  s.dependency 'FBSDKGamingServicesKit'
  s.dependency 'FBSDKLoginKit'
  s.dependency 'FBSDKShareKit'

end
