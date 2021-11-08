# 构建module

# 检查JSBundle文件夹
mkdir -p JSBundle

# 构建业务bundle
npx react-native bundle --entry-file src/index.js\
 --bundle-output JSBundle/ios.bundle\
 --platform ios \
 --assets-dest JSBundle/\
 --dev false \
 --config metro.config.js

export RN_BUILD_TYPE=base
# 构建 base bundle
 npx react-native bundle --entry-file src/base.js\
 --bundle-output JSBundle/base.ios.bundle\
 --platform ios \
 --assets-dest JSBundle/\
 --dev false \
 --config metro.config.js

