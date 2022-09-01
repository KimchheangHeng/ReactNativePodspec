require 'json'
package = JSON.parse(File.read('./package.json'))

Pod::Spec.new do |s|
  s.name                      = "RNPermissions"
  s.dependency                  "React-Core"

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
  s.source_files              = "ios/*.{h,m}"

  # s.dependency "Permission-AppTrackingTransparency"
  # s.dependency "Permission-LocationWhenInUse"
  # s.dependency "Permission-LocationAlways"
  # s.dependency "Permission-Contacts"
end
