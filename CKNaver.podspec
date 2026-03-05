Pod::Spec.new do |s|
  s.name            = "CKNaver"
  s.version         = "2.1"
  s.summary         = "CKNaver iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios, '12.0'
  s.swift_version   = '5.0'
  # s.static_framework = false

  s.source          = { 
     :http => "https://github.com/LorrestGump/cksdk-ios-master/releases/download/2.1/CKNaver.zip",
     :sha256 => "8172c61f0f34db5a06e7c0656e860d05de6a7561f8665a952616b738d198e3e9"
  }

  # s.ios.frameworks        = ['Foundation', 'UIKit']
  s.ios.vendored_frameworks   = [
    'CKNaver/1.3.12/NaverLogin-4.2.3/NaverThirdPartyLogin.xcframework',
    'CKNaver/1.3.12/NNGSDK/NNGSDK.xcframework'
  ]

  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '$(inherited) -lc++',
  }

end
