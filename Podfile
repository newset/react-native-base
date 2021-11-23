# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
source 'http://nexus.medlinker.com/repository/cocoapods/'
source 'https://git.medlinker.com/ios/myspecs'

require_relative './node_modules/react-native/scripts/react_native_pods'
require_relative './node_modules/@react-native-community/cli-platform-ios/native_modules'
inhibit_all_warnings!

target 'Chief' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Chief
  config = use_native_modules!
  use_react_native!(
    :path => config[:reactNativePath],
    # to enable hermes on iOS, change `false` to `true` and then install pods
    :hermes_enabled => false
  )

  pod "InterposeKit"
  pod 'Alamofire', '~> 5.4'

end
