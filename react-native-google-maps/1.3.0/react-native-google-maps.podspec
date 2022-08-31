require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
folly_version = '2021.06.28.00-v2'

Pod::Spec.new do |s|
  s.name                 = "react-native-google-maps"
  s.version              = package['version']
  s.summary              = package["description"]
  s.authors              = package["author"]
  s.homepage             = package["homepage"]
  s.license              = package["license"]
  s.platform             = :ios, "13.0"

  s.source               = { :git => "https://github.com/react-native-maps/react-native-maps.git", :tag=> "v#{s.version}" }
  s.source_files         = "ios/AirGoogleMaps/**/*.{h,m}"
  s.public_header_files  = "ios/AirGoogleMaps/**/*.h"
  s.compiler_flags = folly_compiler_flags + ' -Wno-nullability-completeness' + ' -DHAVE_GOOGLE_MAPS=1' + ' -DHAVE_GOOGLE_MAPS_UTILS=1' + ' -fno-modules'
  s.static_framework     = true
  s.pod_target_xcconfig = {
                            "USE_HEADERMAP" => "YES",
                            "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
                            "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/React-Core/Default/\" \"$(PODS_ROOT)/Google-Maps-iOS-Utils/\" \"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/RCT-Folly\" \"$(PODS_ROOT)/DoubleConversion\" \"$(PODS_ROOT)/React-cxxreact\" \"$(PODS_ROOT)/React-callinvoker\" \"$(PODS_ROOT)/React-runtimeexecutor\" \"$(PODS_ROOT)/React-perflogger\""
                          }

  s.dependency 'React-Core'
  s.dependency 'GoogleMaps'
  s.dependency 'Google-Maps-iOS-Utils', '4.1.0'
  # s.dependency 'react-native-maps'

  s.dependency "boost-for-react-native", "1.63.0"
  s.dependency "DoubleConversion"
  s.dependency "RCT-Folly", folly_version
  s.dependency "glog"
  s.dependency "React-jsinspector"
  s.dependency "React-callinvoker"
  s.dependency "React-runtimeexecutor"
  s.dependency "React-perflogger"
  s.dependency "React-jsi"
  s.dependency "React-logger"
end
