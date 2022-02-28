# 构建module

# 检查JSBundle文件夹
mkdir -p JSBundle node_modules/.rn-cache

# reset cache
echo "" > node_modules/.rn-cache/map.js

export RN_BUILD_TYPE=core
# 构建 base bundle
 npx react-native bundle --entry-file base.ts\
 --bundle-output JSBundle/base.ios.bundle\
 --platform ios \
 --assets-dest JSBundle/\
 --dev true \
 --config metro.config.js

 echo "global.__map = __map; global.__idFromMap = (name) => __map[name] || name" >> ./node_modules/.rn-cache/map.js

 # insert map to base bundle
# node config/patch.js

export RN_BUILD_TYPE=app
# 构建业务bundle
npx react-native bundle --entry-file modules/index.tsx\
 --bundle-output JSBundle/index.ios.bundle\
 --platform ios \
 --assets-dest JSBundle/\
 --dev true \
 --config metro.config.js


