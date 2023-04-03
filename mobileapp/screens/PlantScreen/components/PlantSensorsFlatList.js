import { View, Dimensions, FlatList } from "react-native";
import PlantSensorCard from "./PlantSensorCard";

export default function PlantSensorFlatList({sensors}) {
    const screenWidht = Dimensions.get('screen').width;

    const renderSensor = (sensor) => {
        return (
            <View style={{ width: screenWidht, alignItems: 'center' }}>
                <PlantSensorCard
                    type={sensor.type}
                    value={sensor.value}
                />
            </View>
        )
    }

    return (
        <FlatList
            horizontal
            pagingEnabled
            contentContainerStyle={{ paddingVertical: 50 }}
            data={sensors}
            renderItem={({ item, index }) => {
                return (renderSensor(item))
            }}
        />
    )
}