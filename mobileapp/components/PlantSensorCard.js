import { View, Dimensions } from "react-native";
import { Button, Card, Text, Avatar } from 'react-native-paper';

export default function PlantSensorCard({ type, value }) {
    const cardSize = Dimensions.get('screen').width/2;

    const selectIcon = (type) => {
        switch (type) {
            case "soil":
                return "water"
            case "air":
                return "weather-windy"
            case "temperature":
                return "thermometer"
        }
    }

    const selectLabel = (type) => {
        switch (type) {
            case "soil":
                return "Soil Moisture"
            case "air":
                return "Air Humidity"
            case "temperature":
                return "Air Temperature"
        }
    }

    return (
        <View style={{width: cardSize}}>
            <Card>
                <Card.Content>
                    <View style={{ flexDirection: 'row', alignItems: 'center' }}>
                        <Avatar.Icon
                            size={40}
                            icon={selectIcon(type)}
                            style={{backgroundColor: "#689f38"}}
                            color="white"
                        />
                        <View style={{marginHorizontal: 10}}>
                            <Text variant="bodyLarge">{value}{type == 'temperature' ? "ºC" : "%"}</Text>
                            <Text variant="bodyMedium">{selectLabel(type)}</Text>
                        </View>
                    </View>
                </Card.Content>
            </Card>
        </View>
    )
}