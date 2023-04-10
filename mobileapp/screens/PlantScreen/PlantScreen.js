import { useState, useEffect } from "react";
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
import SensorGraphStack from "./components/SensorGraphStack";
import PlantTaskDndBoard from "./components/PlantTaskDndBoard";

//API functions
import { getPlantInfo, getPlantSpeciesInfo, getAllDivisions, getPlantSensors } from "../../service/PlantScreenService";

export default function PlantScreen({ route }) {
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme();

    // Info for the API call
    const { plantID } = route.params;
    const userID = 1;

    // Get Plant info
    const [plantInfo, setPlantInfo] = useState(null);
    useEffect(() => {
        getPlantInfo(userID, plantID)
        .then((info) => setPlantInfo(info));
    }, [])

    // Get Plant sensors
    const [plantSensor, setPlantSensor] = useState(null);
    useEffect(() => {
        if (plantInfo) {
            getPlantSensors(userID, plantInfo.id)
                .then((info) => setPlantSensor(info));
        }
    }, [plantInfo])

    // Get All Divisions
    const [divisions, setDivisions] = useState(null);
    useEffect(() => {
        if (plantInfo) {
            getAllDivisions(userID)
                .then((info) => setDivisions(info));
        }
    }, [plantInfo])

    // API call to delete plant;
    // API call to retrieve sensors associated with the plant;

    
    if (plantInfo && divisions && plantSensor) {
        return (
            <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
                <GreenBar />
                <PlantHeader name={plantInfo.name} />
                <Tabs
                    style={{ backgroundColor: theme.colors.background }}
                >
                    <TabScreen label="Info" icon="information">
                        <ScrollView>
                            <View style={{ paddingBottom: 100, paddingTop: 30 }}>
                                <CheckSpeciesButton species={plantInfo.species}/>
                                <PlantAvatar
                                    image={plantInfo.plantPhoto}
                                    species={plantInfo.species["commonName"]}
                                />
                                <DeletePlant
                                    name={plantInfo.name}
                                />
                                <SensorsCarousel />
                                <PlantStatus name={plantInfo.name} status={plantInfo.plantCondition}/>
                                <PlantInformation 
                                    plant={plantInfo} 
                                    division={plantInfo.division}
                                    divisions={divisions}
                                    sensor={plantSensor}
                                />
                            </View>
                        </ScrollView>
                    </TabScreen>
                    <TabScreen label="Statistics " icon="chart-line">
                        <SensorGraphStack />
                    </TabScreen>
                    <TabScreen label="Tasks " icon="pencil">
                        <PlantTaskDndBoard />
                    </TabScreen>
                </Tabs>
                <BottomMenu screenHeight={screenHeight} />
            </View>
        )
    }
}