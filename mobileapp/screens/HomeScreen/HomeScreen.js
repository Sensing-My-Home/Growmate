import React, {useEffect, useState} from "react";
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
import {getPlants, getDivisionsAndAssociatedPlants} from "../../service/HomeScreenService";
import {userFirstName, userID, userType} from "../../user";

export default function HomeScreen() {
    const [userPlants, setUserPlants] = useState([]);
    const [userDivisions, setUserDivisions] = useState([]);
    const [updateCount, setUpdateCount] = useState(0);

    const handleUpdate = () => {
        setUpdateCount(updateCount + 1);
      }
    

    useEffect( () => {
        getPlants(userID).then((plants) => {setUserPlants(plants)})
    }, [updateCount]);


    useEffect( () => {
        getDivisionsAndAssociatedPlants(userID).then(
            (divisions) => {
                setUserDivisions(divisions)
            }
        );
    }, [updateCount]);


    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    const [selectedTab, setSelectedTab] = useState(0)


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
            <WelcomeHeader premium={userType === "PREMIUM"} name={userFirstName}/>
            </View>
            {userType === "PREMIUM" ?
                <Tabs
                    defaultIndex={0} // default = 0
                    style={{ backgroundColor:'#fff' }} // works the same as AppBar in react-native-paper
                    disableSwipe={true} // (default=false) disable swipe to left/right gestures
                    onChangeIndex={(newIndex) => {setSelectedTab(newIndex)}}
                >
                    <TabScreen label="Inventory">
                        <View>
                            <SearchBar />
                            <PlantCards plants={userPlants}/>
                        </View>
                    </TabScreen>
                    <TabScreen label="Divisions">
                        <Divisions divisions={userDivisions} plants={userPlants} handleUpdate={handleUpdate}/>
                    </TabScreen>
                    <TabScreen
                        label="Sensors"
                    >
                        <View>
                        <SensorRow sensorTargets={userDivisions} sensorsType={"Division"} sensorsValues={sensors}/>
                        <SensorRow sensorTargets={userPlants} sensorsType={"Plant"} sensorsValues={sensors}/>
                        </View>
                    </TabScreen>
                </Tabs>
                :
                <View>
                    <SearchBar />
                    <PlantCards plants={userPlants} />
                </View>
            }
            <PlusButton index={selectedTab}/>
            <BottomMenu screenHeight={screenHeight} active={"leaf"} />
        </View>
    )
}