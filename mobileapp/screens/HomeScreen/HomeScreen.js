import React from "react";
import { View, Dimensions } from "react-native";
import BottomMenu from "../../components/BottomMenu";
import SearchBar from "../../components/SearchBar";
import WelcomeHeader from "./components/WelcomeHeader"
import GreenBar from "../../components/GreenBar";
import PlantCards from "./components/PlantCards";
import {useTheme} from "react-native-paper";
import PlusButton from "./components/PlusButton";
import {Tabs, TabScreen} from 'react-native-paper-tabs';
import Divisions from "./components/Divisions";
import SensorRow from "./components/SensorRow";

export default function HomeScreen() {
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    const premium = true;
    const plants = [
        { name: 'Wendy', image: require('../../assets/plant.jpeg'), state: "good"},
        { name: 'Beth', image: require('../../assets/plant2.webp'), state: "okay" },
        { name: 'Anthony', image: require('../../assets/plant3.jpeg'), state: "bad" },
        { name: 'Frederick', image: require('../../assets/plant4.jpeg'), state: "okay" },
        { name: 'John', image: require('../../assets/plant5.jpeg'), state: "good" }
    ];
    const divisions = [
        {name: "Kitchen", plants: [
                { name: 'Wendy', image: require('../../assets/plant.jpeg'), state: "good"},
                { name: 'Beth', image: require('../../assets/plant2.webp'), state: "okay" },
                { name: 'Anthony', image: require('../../assets/plant3.jpeg'), state: "bad" }
            ]},
        {name: "Balcony", plants: [
                { name: 'Frederick', image: require('../../assets/plant4.jpeg'), state: "okay" },
                { name: 'John', image: require('../../assets/plant5.jpeg'), state: "good" }
            ]}
    ]

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
            <View style={{ position: 'relative', zIndex: 1 }}>
            <WelcomeHeader premium={premium}  />
            </View>
            {premium ?
                <Tabs
                    defaultIndex={0} // default = 0
                    style={{ backgroundColor:'#fff' }} // works the same as AppBar in react-native-paper
                    disableSwipe={true} // (default=false) disable swipe to left/right gestures
                >
                    <TabScreen label="Inventory">
                        <View>
                            <SearchBar />
                            <PlantCards plants={plants} />
                        </View>
                    </TabScreen>
                    <TabScreen label="Divisions">
                        <Divisions divisions={divisions}/>
                    </TabScreen>
                    <TabScreen
                        label="Sensors"
                    >
                        <View>
                        <SensorRow sensorTargets={divisions} sensorsType={"Division"} sensorsValues={sensors}/>
                        <SensorRow sensorTargets={plants} sensorsType={"Plant"} sensorsValues={sensors}/>
                        </View>
                    </TabScreen>
                </Tabs>
                :
                <View>
                    <SearchBar />
                    <PlantCards plants={plants} />
                </View>
            }
            <PlusButton/>
            <BottomMenu screenHeight={screenHeight} active={"leaf"} />
        </View>
    )
}