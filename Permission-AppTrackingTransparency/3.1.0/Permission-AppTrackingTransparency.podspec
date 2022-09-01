require 'json'
package = JSON.parse(File.read('package.json'))

Pod::Spec.new do |s|
  s.name                      = "Permission-AppTrackingTransparency"
  s.dependency                  "RNPermissions"

  s.version                   = package["version"]
  s.license                   = package["license"]
  s.summary                   = package["description"]
  s.authors                   = package["author"]
  s.homepage                  = package["homepage"]

  s.ios.deployment_target     = "10.0"
  s.tvos.deployment_target    = "11.0"
  s.requires_arc              = true
  s.static_framework = true

  s.source                    = { :git => 'https://github.com/zoontek/react-native-permissions.git', :tag => s.version }
  s.source_files              = "ios/AppTrackingTransparency/*.{h,m}"
  s.frameworks                = "AppTrackingTransparency"

  s.pod_target_xcconfig = {
                            "USE_HEADERMAP" => "YES",
                            "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
                            "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/React-Core/Default/\""
                          }

  s.dependency 'React-Core'
end
