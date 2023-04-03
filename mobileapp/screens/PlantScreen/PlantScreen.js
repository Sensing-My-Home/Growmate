import React from "react";
import { View, Dimensions, ScrollView } from "react-native";
import BottomMenu from "../../components/BottomMenu";
import GreenBar from "../../components/GreenBar";
import PlantHeader from "./components/PlantHeader";
import PlantAvatar from "./components/PlantAvatar";
import DeletePlant from "./components/DeletePlant";
import CheckSpeciesButton from "./components/CheckSpeciesButton";
import PlantSensorFlatList from "./components/PlantSensorsFlatList";
import PlantInformation from "./components/PlantInformation";
import { Tabs, TabScreen } from 'react-native-paper-tabs';
import { useTheme } from "react-native-paper";


export default function PlantScreen({ route }) {
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme();

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
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <PlantHeader name={name} />
            <Tabs
                style={{backgroundColor: theme.colors.background}}
                disableSwipe={true}
            >
                <TabScreen label="Info" icon="information">
                    <ScrollView>
                        <View style={{ paddingBottom: 100, paddingTop: 30 }}>
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
                            <PlantInformation />
                        </View>
                    </ScrollView>
                </TabScreen>
                <TabScreen label="Statistics " icon="compass">
                    <PlantAvatar
                        image={image}
                        species="Aloe Vera"
                    />
                </TabScreen>
                <TabScreen label="Tasks " icon="compass">
                    <PlantAvatar
                        image={image}
                        species="Aloe Vera"
                    />
                </TabScreen>
            </Tabs>
            <BottomMenu screenHeight={screenHeight} />
        </View>
    )
}