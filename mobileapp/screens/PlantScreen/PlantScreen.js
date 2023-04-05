import React from "react";
import { View, Dimensions, ScrollView } from "react-native";
import { Tabs, TabScreen } from 'react-native-paper-tabs';
import { useTheme } from "react-native-paper";

import BottomMenu from "../../components/BottomMenu";
import GreenBar from "../../components/GreenBar";
import PlantHeader from "./components/PlantHeader";
import PlantAvatar from "./components/PlantAvatar";
import DeletePlant from "./components/DeletePlant";
import CheckSpeciesButton from "./components/CheckSpeciesButton";
import PlantInformation from "./components/PlantInformation";
import SensorsCarousel from "./components/SensorsCarousel";
import PlantStatus from "./components/PlantStatus";
import SensorGraph from "./components/SensorGraph";
import SensorGraphStack from "./components/SensorGraphStack";

export default function PlantScreen({ route }) {
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme();

    const { name, image } = route.params;

    const [visible, setVisible] = React.useState(false);
    const showDialog = () => setVisible(true);
    const hideDialog = () => setVisible(false);

    

    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <PlantHeader name={name} />
            <Tabs
                style={{ backgroundColor: theme.colors.background }}
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
                            <SensorsCarousel />
                            <PlantStatus name={name}/>
                            <PlantInformation name={name} />
                        </View>
                    </ScrollView>
                </TabScreen>
                <TabScreen label="Statistics " icon="chart-line">
                    <ScrollView> 
                        <SensorGraphStack />
                    </ScrollView>
                </TabScreen>
                <TabScreen label="Tasks " icon="pencil">
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