require 'json'

packageJson = JSON.parse(File.read('package.json'))
version = packageJson["version"]
description = packageJson["description"]
homepage = packageJson["homepage"]
license = packageJson["license"]
author = packageJson["author"]
repository = packageJson["repository"]["url"]
iqVersion = version.split('-').first

Pod::Spec.new do |s|
	s.name           = "RNExitApp"
	s.version        = version
	s.description    = description
	s.homepage       = homepage
	s.summary        = "Exit,close,kill,shutdown app completely for React Native"
	s.license        = license
	s.authors        = author
	# s.source         = { :git => repository, :tag => version }
	s.source         = { :git => "https://github.com/wumke/react-native-exit-app" }
	s.platform       = :ios, "9.0"
	# s.preserve_paths = 'README.md', 'package.json', '*.js'
	s.preserve_paths = 'README.md', '*.js'
	s.source_files   = 'ios/RNExitApp/**/*.{h,m}'

	s.pod_target_xcconfig = {
                            "USE_HEADERMAP" => "YES",
                            "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
                            "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/React-Core/Default/\""
                          }

	s.dependency 'React-Core'
end
