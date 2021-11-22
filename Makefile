glog := './node_modules/react-native/third-party-podspecs/glog.podspec'
doubleconversion := './node_modules/react-native/third-party-podspecs/DoubleConversion.podspec'
folly := './node_modules/react-native/third-party-podspecs/RCT-Folly.podspec'

fix:
	sed 's|github.com/google/glog|gitee.com/zhuzhenping/glog|g' $(glog) > Specs/glog.podspec
	mv Specs/glog.podspec $(glog)
	sed 's|github.com/facebook/folly|gitee.com/gszx_admin/folly|g' $(folly) > Specs/folly.podspec
	mv Specs/folly.podspec $(folly)
	sed 's|github.com/google/double-conversion|gitee.com/mirrors/double-conversion|g' $(doubleconversion) > Specs/DoubleConversion.podspec
	mv Specs/DoubleConversion.podspec $(doubleconversion)

build: 
	rm -rf JSBundle/*
	mkdir -p JSBundle/modules
	sh scripts/build.sh