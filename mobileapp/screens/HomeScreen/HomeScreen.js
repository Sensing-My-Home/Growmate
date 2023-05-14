import React, { useEffect, useState, useRef } from "react";
import { View, Dimensions } from "react-native";
import BottomMenu from "../../components/BottomMenu";
import SearchBar from "../../components/SearchBar";
import WelcomeHeader from "./components/WelcomeHeader"
import GreenBar from "../../components/GreenBar";
import PlantCards from "./components/PlantCards";
import { useTheme } from "react-native-paper";
import PlusButton from "./components/PlusButton";
import { Tabs, TabScreen } from 'react-native-paper-tabs';
import Divisions from "./components/Divisions";
import SensorRow from "./components/SensorRow";
import SensorsTab from "./components/SensorsTab";

// API Calls
import { getPlants, getDivisionsAndAssociatedPlants, getFirstName, getSensors } from "../../service/HomeScreenService";

export default function HomeScreen() {
    const [userPlants, setUserPlants] = useState([]);
    const [userDivisions, setUserDivisions] = useState([]);
    const [userFirstName, setUserFirstName] = useState("");
    const [updateCount, setUpdateCount] = useState(0);
    const [sensors, setSensors] = useState(null);

    const handleUpdate = () => {
        setUpdateCount(updateCount + 1);
    }


    useEffect(() => {
        getPlants(1).then((plants) => { setUserPlants(plants) })
    }, [updateCount]);


    useEffect(() => {
        getDivisionsAndAssociatedPlants(1).then(
            (divisions) => {
                setUserDivisions(divisions)
            }
        );
    }, [updateCount]);

    useEffect(() => {
        getFirstName(1).then(
            (name) => {
                setUserFirstName(name.name.split(" ")[0])
            }
        );
    }, []);

    useEffect(() => {
        getSensors(1).then(
            (sensors) => {
                setSensors(sensors)
            }
        )
    }, [])

    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    const [selectedTab, setSelectedTab] = useState(0)
    const premium = true;
    // API call to retrieve plants (which includes their division id);
    const plants = [
        { name: 'Wendy', image: require('../../assets/plant.jpeg'), state: "good" },
        { name: 'Beth', image: require('../../assets/plant2.webp'), state: "okay" },
        { name: 'Anthony', image: require('../../assets/plant3.jpeg'), state: "bad" },
        { name: 'Frederick', image: require('../../assets/plant4.jpeg'), state: "okay" },
        { name: 'John', image: require('../../assets/plant5.jpeg'), state: "good" }
    ];

    // API call to retrieve divisions
    const divisions = [
        {
            name: "Kitchen", plants: [
                { name: 'Wendy', image: require('../../assets/plant.jpeg'), state: "good" },
                { name: 'Beth', image: require('../../assets/plant2.webp'), state: "okay" },
                { name: 'Anthony', image: require('../../assets/plant3.jpeg'), state: "bad" }
            ]
        },
        {
            name: "Balcony", plants: [
                { name: 'Frederick', image: require('../../assets/plant4.jpeg'), state: "okay" },
                { name: 'John', image: require('../../assets/plant5.jpeg'), state: "good" }
            ]
        }
    ]

    // one API call to retrieve all sensors values;

    const s = [
        {
            id: 0,
            name: "Living room temperature sensor",
            sensorCode: "TMP123",
            division_id: 1,
            type: "division"
        },
        {
            id: 1,
            name: "Bedroom humidity sensor",
            sensorCode: "TMP124",
            division_id: 2,
            type: "division"
        },
        {
            id: 2,
            name: "Juan soil moisture sensor",
            sensorCode: "TMP125",
            plant_id: 4,
            type: "plant"
        },
    ];

    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <View style={{ position: 'relative', zIndex: 1 }}>
                <WelcomeHeader premium={premium} name={userFirstName} />
            </View>
            {premium ?
                <Tabs
                    defaultIndex={0} // default = 0
                    style={{ backgroundColor: '#fff' }} // works the same as AppBar in react-native-paper
                    disableSwipe={true} // (default=false) disable swipe to left/right gestures
                    onChangeIndex={(newIndex) => { setSelectedTab(newIndex) }}
                >
                    <TabScreen label="Inventory">
                        <View>
                            <SearchBar />
                            <PlantCards plants={userPlants} />
                        </View>
                    </TabScreen>
                    <TabScreen label="Divisions">
                        <Divisions divisions={userDivisions} plants={userPlants} handleUpdate={handleUpdate} />
                    </TabScreen>
                    <TabScreen
                        label="Sensors"
                    >
                        <View>
                            {userDivisions.length > 0 && userPlants && sensors && <SensorsTab userDivisions={userDivisions} sensors={sensors} userPlants={userPlants} />}
                        </View>
                    </TabScreen>
                </Tabs>
                :
                <View>
                    <SearchBar />
                    <PlantCards plants={userPlants} />
                </View>
            }
            <PlusButton index={selectedTab} />
            <BottomMenu screenHeight={screenHeight} active={"leaf"} />
        </View>
    )
}