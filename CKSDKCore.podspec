Pod::Spec.new do |s|
  s.name = "CKSDKCore"
  s.version = "2.0.0"
  s.summary = "CKSDKCore iOS SDK"
  s.homepage = "http://github.com/LorrestGump/cksdk-ios-master"
  s.license = { :type => 'Proprietary', :text => ''}
  s.author = 'YaYaWan'
  s.requires_arc = true
  s.platform = :ios, '12.0'
  s.swift_version = '5.0'
  s.static_framework = true
  s.source = {
    :git => 'https://github.com/LorrestGump/cksdk-ios-master.git',
    :tag => s.version.to_s,
  }
  s.ios.deployment_target = '12.0'
  s.ios.frameworks = ['AdServices','AdSupport']
  s.vendored_frameworks = 'CKSDKCore.xcframework'
end
