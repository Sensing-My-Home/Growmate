import { View } from "react-native";
import { Card, Avatar, Button, Text } from "react-native-paper";

export default function SensorInfoCard({sensor}) {
    return(
        <View style={{paddingVertical: 10}}>
            <Card>
                <Card.Title title={sensor.name}/>
            </Card>
        </View>
    )
}