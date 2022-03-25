import React from "react";
import { View } from "react-native";
import { styles } from "./styles";
import WebView from "react-native-webview";
import FastImage from "react-native-fast-image";

type Score = {
  name: string;
  value: number;
};

const script = `
(function() {
  let icpbox = {
    authorize: function() {
      return new Promise((resolve, reject) => {
        window.ReactNativeWebView.postMessage(JSON.stringify({action: "authorize"}));
        const listener = function(event) {
          const { status } = event.detail;
          if(status === 'success') {
            return resolve(event.detail);
            
          }
          return reject('Auth Failed');
        }
        window.addEventListener('dappauth', listener, { capture: true, once: true });
      });
    }
  };
  window.icpbox = icpbox;
})();
true; // note: this is required, or you'll sometimes get silent failures
`;

const RNHighScores: React.FC<{ scores: Score[] }> = () => {
  const ref = React.useRef<WebView | null>(null);
  function handleMessage(message: string) {
    // show
    ref.current!.injectJavaScript(`(function() {
      const event = new CustomEvent('dappauth', { detail: {status: "success", publicKey: "", principle: ""}});
      window.dispatchEvent(event)
      console.log("message", ${message})
  })();`);
  }

  return (
    <View style={[styles.container]}>
      <FastImage
        source={{
          // uri: "https://pics7.baidu.com/feed/14ce36d3d539b6009d2b192d75e1c023c45cb7fa.jpeg?token=acc4ef8c6ed3552e19df56e8a7e07ae1",
          // uri: "https://upload.wikimedia.org/wikipedia/commons/4/40/Antu_im-user-online.svg",
          uri: "https://simpleicons.org/icons/github.svg",
          // uri: "https://zvycl-fyaaa-aaaah-qckmq-cai.raw.ic0.app/?type=thumbnail&tokenid=ijemk-uykor-uwiaa-aaaaa-b4ast-eaqca-aadr3-q",
        }}
        style={{
          width: 200,
          height: 200,
          // backgroundColor: "red",
          borderRadius: 4,
        }}
        resizeMode="cover"
        onLoadEnd={() => console.log("end")}
        onError={() => console.log("error: ")}
      ></FastImage>
      {/* <WebView
        ref={ref}
        injectedJavaScriptBeforeContentLoaded={script}
        source={{ uri: "http://localhost:8080/api/" }}
        style={{ width: "100%", height: "100%" }}
        onLoadStart={() => {
          console.log("test");
        }}
        onMessage={(event) => {
          const action = event.nativeEvent.data;
          handleMessage(action);
        }}
      ></WebView> */}
    </View>
  );
};

export default RNHighScores;
