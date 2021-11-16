import React from "react";
import { AppRegistry, StyleSheet, Text, View } from "react-native";

// @ts-ignore
const modules = require.getModules();

type Score = {
  name: string;
  value: number;
}

const RNHighScores: React.FC<{scores: Score[]}> = ({ scores }) => {
  const contents = scores.map((score) => (
    <Text key={score.name}>
      {score.name}:{score.value}
      {"\n"}
    </Text>
  ));
  return (
    <View style={styles.container}>
      <Text style={styles.highScoresTitle}>2048 High Scores!</Text>
      <Text style={styles.scores}>{contents}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#FFFFFF",
  },
  highScoresTitle: {
    fontSize: 20,
    textAlign: "center",
    color: "#ddd",
    margin: 10,
  },
  scores: {
    textAlign: "center",
    color: "#333333",
    marginBottom: 5,
  },
});

// Module name
AppRegistry.registerComponent("RNHighScores", () => RNHighScores);

export default RNHighScores;
