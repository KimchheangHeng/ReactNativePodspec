require 'json'
# require './firebase_json'
package = JSON.parse(File.read(File.join(__dir__, 'package.json')))
firebase_sdk_version = package['sdkVersions']['ios']['firebase']

Pod::Spec.new do |s|
  s.name                = "RNFBApp"
  s.version             = package["version"]
  s.description         = package["description"]
  s.summary             = <<-DESC
                            A well tested feature rich Firebase implementation for React Native, supporting iOS & Android.
                          DESC
  s.homepage            = "http://invertase.io/oss/react-native-firebase"
  s.license             = package['license']
  s.authors             = "Invertase Limited"
  s.source              = { :git => "https://github.com/invertase/react-native-firebase.git", :tag => "v#{s.version}" }
  s.social_media_url    = 'http://twitter.com/invertaseio'
  s.ios.deployment_target = "10.0"
  s.cocoapods_version   = '>= 1.10.0'
  s.source_files        = "packages/app/ios/**/*.{h,m}"
  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/React-Core/Default/\" \"$(PODS_ROOT)/RCT-Folly\"" }

  # React Native dependencies
  s.dependency          'React-Core'

  if defined?($FirebaseSDKVersion)
    Pod::UI.puts "#{s.name}: Using user specified Firebase SDK version '#{$FirebaseSDKVersion}'"
    firebase_sdk_version = $FirebaseSDKVersion
  end

  # Firebase dependencies
  s.dependency          'Firebase/CoreOnly', firebase_sdk_version

  if defined?($RNFirebaseAsStaticFramework)
    Pod::UI.puts "#{s.name}: Using overridden static_framework value of '#{$RNFirebaseAsStaticFramework}'"
    s.static_framework = $RNFirebaseAsStaticFramework
  else
    s.static_framework = false
  end
end
