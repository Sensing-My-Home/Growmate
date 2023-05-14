import React from "react";
import { View } from "react-native";
import { Card, Avatar, Button, Text, useTheme } from "react-native-paper";

export default function SensorInfoCard({ sensor }) {
  const theme = useTheme();

  return (
    <View style={{ paddingVertical: 10 }}>
      <Card style={{ backgroundColor: theme.colors.background }}>
        <Card.Title
          title={sensor.name}
          subtitle={sensor.type === "plant" ? "Plant Sensor" : "Division Sensor"}
          left={(props) => (
            <Avatar.Icon
              {...props}
              icon={sensor.type === "plant" ? "flower" : "layers"}
              style={{ backgroundColor: theme.colors.primary }}
            />
          )}
        />
        <Card.Content>
          <Text>Sensor Code: {sensor.sensorCode}</Text>
        </Card.Content>
        <Card.Actions>
          <Button style={{backgroundColor: theme.colors.background}}>View Details</Button>
        </Card.Actions>
      </Card>
    </View>
  );
}