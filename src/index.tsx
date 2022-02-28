import React from "react";
import { AppRegistry, StyleSheet, Text, View } from "react-native";
import { styles } from "./styles";
import WebView from "react-native-webview";

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
          console.log('details', event.detail);
          if(status === 'success') {
            resolve(event.detail);
            return
          }
          reject('Auth Failed');
        }

        window.addEventListener('dappauth', listener, {
          capture: true,
          once: true
        });
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
      <WebView
        ref={ref}
        injectedJavaScriptBeforeContentLoaded={script}
        source={{ uri: "http://localhost:8080/api/" }}
        style={{ width: "100%", height: "100%" }}
        onLoadStart={() => {
          console.log("test");
        }}
        onMessage={(event) => {
          const action = event.nativeEvent.data;
          console.log("test", event.nativeEvent.data);
          handleMessage(action);
        }}
      ></WebView>
    </View>
  );
};

export default RNHighScores;
