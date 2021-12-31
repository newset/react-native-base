import React from "react";
import { AppRegistry, StyleSheet, Text, View } from "react-native";
import { styles } from "./styles";
// @ts-ignore
const modules = require.getModules();

type Score = {
  name: string;
  value: number;
};

const RNHighScores: React.FC<{ scores: Score[] }> = ({ scores }) => {
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

// Module name
AppRegistry.registerComponent("RNHighScores", () => RNHighScores);

export default RNHighScores;
