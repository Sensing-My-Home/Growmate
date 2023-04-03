import React from "react";
import { View, Dimensions, ScrollView } from "react-native";
import BottomMenu from "../../components/BottomMenu";
import GreenBar from "../../components/GreenBar";
import PlantHeader from "./components/PlantHeader";
import PlantAvatar from "./components/PlantAvatar";
import DeletePlant from "./components/DeletePlant";
import CheckSpeciesButton from "./components/CheckSpeciesButton";
import PlantSensorFlatList from "./components/PlantSensorsFlatList";
import PlantSegmentedButtons from "./components/PlantSegmentedButtons";


export default function PlantScreen({ route }) {
    const screenHeight = Dimensions.get('screen').height;

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

    return (
        <View style={{ height: screenHeight }}>
            <GreenBar />
            <PlantHeader name={name} />
            <PlantSegmentedButtons />
            <ScrollView>
                <View style={{paddingBottom: 100}}>
                    <CheckSpeciesButton />
                    <PlantAvatar
                        image={image}
                        species="Aloe Vera"
                    />
                    <DeletePlant
                        name={name}
                        visible={visible}
                        showDialog={showDialog}
                        hideDialog={hideDialog}
                    />
                    <PlantSensorFlatList
                        sensors={sensors}
                    />
                </View>
            </ScrollView>
            <BottomMenu screenHeight={screenHeight} />
        </View>
    )
}