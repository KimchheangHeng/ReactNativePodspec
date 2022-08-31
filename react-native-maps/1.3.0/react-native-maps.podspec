require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "react-native-maps"
  s.version      = package['version']
  s.summary      = package["description"]
  s.authors      = package["author"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.platform     = :ios, "11.0"

  s.source       = { :git => "https://github.com/react-native-maps/react-native-maps.git", :tag=> "v#{s.version}" }
  s.source_files  = "ios/AirMaps/**/*.{h,m}"

  s.pod_target_xcconfig = {
                            "USE_HEADERMAP" => "YES",
                            "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
                            "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/React-Core/Default/\" \"$(PODS_ROOT)/Google-Maps-iOS-Utils/\" \"$(PODS_ROOT)/react-native-google-maps/\""
                          }

  s.dependency 'React-Core'
  # s.dependency 'GoogleMaps', '7.0.0'
  # s.dependency 'Google-Maps-iOS-Utils'
  # s.dependency 'react-native-google-maps'
end
