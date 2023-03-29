import React from "react";
import { View, Dimensions, ScrollView, FlatList } from "react-native";
import BottomMenu from "../components/BottomMenu";
import GreenBar from "../components/GreenBar";
import PlantHeader from "../components/PlantHeader";
import PlantAvatar from "../components/PlantAvatar";
import DeletePlantDialog from "../components/DeletePlantDialog";
import PlantSensorCard from "../components/PlantSensorCard";
import { Button, Badge, Text, SegmentedButtons } from "react-native-paper";

export default function PlantScreen({ route }) {
    const screenHeight = Dimensions.get('screen').height;
    const screenWidht = Dimensions.get('screen').width;

    const { name, image } = route.params;

    const [visible, setVisible] = React.useState(false);
    const showDialog = () => setVisible(true);
    const hideDialog = () => setVisible(false);

    const sensors = [
        {
            id: 0,
            type: 'soil',
            value: '56'
        },
        {
            id: 1,
            type: 'temperature',
            value: '18'
        },
        {
            id: 2,
            type: 'air',
            value: '78'
        },
    ];

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
        <View style={{ height: screenHeight }}>
            <GreenBar />
            <PlantHeader name={name} />
            <View style={{ alignItems: 'center', marginVertical: 25 }}>
                <Button
                    textColor="white"
                    buttonColor="#689f38"
                >
                    Check Species Info
                </Button>
            </View>
            <PlantAvatar
                image={image}
                species="Aloe Vera"
            />
            <View style={{ alignItems: 'center', marginVertical: 10 }}>
                <Button
                    textColor="white"
                    buttonColor="red"
                    onPress={showDialog}
                >
                    Delete Plant
                </Button>
            </View>
            <BottomMenu screenHeight={screenHeight} />
            <DeletePlantDialog
                name={name}
                visible={visible}
                hideDialog={hideDialog}
            />
            <FlatList
                horizontal
                pagingEnabled
                contentContainerStyle={{ paddingVertical: 50 }}
                data={sensors}
                renderItem={({ item, index }) => {
                    return (renderSensor(item))
                }}
            />
        </View>
    )
}