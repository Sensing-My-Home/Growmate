import { useState, useEffect } from "react";
import { View, Dimensions, ScrollView } from "react-native";
import { Tabs, TabScreen } from 'react-native-paper-tabs';
import { useTheme } from "react-native-paper";
import { useNavigation, StackActions } from '@react-navigation/native';

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
import { getPlantInfo, getAllDivisions, getPlantTasksToday, getSensorsForPlant, deletePlant } from "../../service/PlantScreenService";
import { deleteImage } from "../../service/FirebaseService";

export default function PlantScreen({ route }) {
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme();
    const navigation = useNavigation();

    // Info for the API call
    const { plantID } = route.params;
    const userID = 1;

    // Get Plant info
    const [plantInfo, setPlantInfo] = useState(null);
    useEffect(() => {
        getPlantInfo(userID, plantID)
        .then((info) => setPlantInfo(info));
    }, [])

    // Get All sensors associated with a plant
    const [sensors, setSensors] = useState(null)
    useEffect(() => {
        if (plantInfo) {
            getSensorsForPlant(userID, plantID, plantInfo.division["id"])
            .then((info) => setSensors(info));
        };
    }, [plantInfo])

    // Get All Divisions
    const [divisions, setDivisions] = useState(null);
    useEffect(() => {
        getAllDivisions(userID)
        .then((info) => setDivisions(info));
    }, [])

    //Get Plant tasks for today
    const [todayTasks, setTodadyTasks] = useState(null);
    useEffect(() => {
        getPlantTasksToday(userID, plantID)
        .then((info) => setTodadyTasks(info));
    }, [])

    // API call to delete plant;
    const handleDeletePlant = async () => {
        await deleteImage(userID, plantInfo.name);
        await deletePlant(userID, plantID);
        navigation.dispatch(StackActions.replace('Home'));
    }

    
    if (plantInfo && divisions && sensors && todayTasks) {
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
                                <CheckSpeciesButton plantId={plantID}/>
                                <PlantAvatar
                                    image={plantInfo.plantPhoto}
                                    species={plantInfo.species["commonName"]}
                                />
                                <DeletePlant
                                    name={plantInfo.name}
                                    deletePlant={handleDeletePlant}
                                />
                                <SensorsCarousel />
                                <PlantStatus name={plantInfo.name} status={plantInfo.plantCondition}/>
                                <PlantInformation
                                    plant={plantInfo}
                                    division={plantInfo.division}
                                    divisions={divisions}
                                />
                            </View>
                        </ScrollView>
                    </TabScreen>
                    <TabScreen label="Statistics " icon="chart-line">
                        <SensorGraphStack />
                    </TabScreen>
                    <TabScreen label="Tasks " icon="pencil">
                        <PlantTaskDndBoard 
                            userID={userID}
                            plantID={plantInfo.id}
                            tasks={todayTasks}
                        />
                    </TabScreen>
                </Tabs>
                <BottomMenu screenHeight={screenHeight} />
            </View>
        )
    }
}