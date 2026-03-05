Pod::Spec.new do |s|
  s.name            = "VKIDManager"
  s.version         = "2.1"
  s.summary         = "VKIDManager iOS SDK"
  s.homepage        = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license         = { :type => 'Proprietary', :text => 'Copyright 2018 CKSDK Ltd. All rights reserved.'}
  s.authors         = 'YaYaWan'
  s.requires_arc    = true
  s.platform        = :ios, '13.0'
  s.swift_version   = '5.0'
  s.static_framework = true

  s.source          = { :git => "https://github.com/LorrestGump/cksdk-ios-master.git", :tag => s.version.to_s }
  s.source_files    = 'Adapter/VKIDManager/**/*.{h,m,swift}'

  s.ios.frameworks        = ['Foundation', 'UIKit']

  s.dependency 'VKID', '~> 2.2'

  # s.user_target_xcconfig = {
  #   'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO'
  # }
  # s.pod_target_xcconfig = {
  #   'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO',
  #   'OTHER_LDFLAGS' => '$(inherited)'
  # }

end
