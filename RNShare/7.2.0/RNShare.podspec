require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "RNShare"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.author       = { package["author"]["name"] => package["author"]["email"] }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/react-native-community/react-native-share.git", :tag => "v#{s.version}" }

  s.source_files  = "ios/**/*.{h,m}"

  s.pod_target_xcconfig = {
                            "USE_HEADERMAP" => "YES",
                            "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
                            "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/React-Core/Default/\""
                          }

  s.dependency 'React'
  s.dependency 'React-Core'

  s.ios.weak_framework = 'LinkPresentation'
end
