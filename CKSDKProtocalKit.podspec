Pod::Spec.new do |s|
  s.name            = "CKSDKProtocalKit"
  s.version         = "2.0.0"
  s.summary         = "CKSDKProtocalKit iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.static_framework = false
  s.source          = { 
     http: "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.0.0/CKSDKProtocalKit.xcframework.zip",
     sha256: "7ad08e6478540978f8b68ef750e0130c40454e60d587460d32bb50ecd296a682"
  }
  s.ios.deployment_target = '12.0'
  s.ios.frameworks        = ['Foundation', 'UIKit']
  s.ios.vendored_frameworks   = 'CKSDKProtocalKit.xcframework'

end
