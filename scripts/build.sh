# 构建module

# 检查JSBundle文件夹
mkdir -p JSBundle

# 构建业务bundle
npx react-native bundle --entry-file modules/index.tsx\
 --bundle-output JSBundle/modules/index.ios.bundle\
 --platform ios \
 --assets-dest JSBundle/\
 --dev false \
 --config metro.config.js

export RN_BUILD_TYPE=base
# 构建 base bundle
 npx react-native bundle --entry-file base.ts\
 --bundle-output JSBundle/base.ios.bundle\
 --platform ios \
 --assets-dest JSBundle/\
 --dev false \
 --config metro.config.js

