# clone react-native
puts "check react-native dependency"
# check 
# Pod::Executable.execute_command("npm", ["i", 'react-native@0.64.3 react-native-webview --registry=https://registry.npmmirror.com'], true)
`npm i react-native@0.64.3 react-native-webview --registry=https://registry.npmmirror.com`
puts "react-native dependency done"

# require_relative './node_modules/react-native/scripts/react_native_pods'
# require_relative './node_modules/@react-native-community/cli-platform-ios/native_modules'