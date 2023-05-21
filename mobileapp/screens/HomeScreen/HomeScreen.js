import React, { useEffect, useState } from "react";
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
import {userFirstName, userID, userType} from "../../user";
import SensorsTab from "./components/SensorsTab";

// API Calls
import { getPlants, getDivisionsAndAssociatedPlants, getSensors } from "../../service/HomeScreenService";

export default function HomeScreen() {
    const [userPlants, setUserPlants] = useState([]);
    const [userDivisions, setUserDivisions] = useState([]);
    const [updateCount, setUpdateCount] = useState(0);
    const [sensors, setSensors] = useState(null);

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

    useEffect(() => {
        getSensors(userID).then(
            (sensors) => {
                setSensors(sensors)
            }
        )
    }, [])

    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    const [selectedTab, setSelectedTab] = useState(0)

    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <View style={{ position: 'relative', zIndex: 1 }}>
            <WelcomeHeader premium={userType === "PREMIUM"} name={userFirstName}/>
            </View>
            {userType === "PREMIUM" ?
                <Tabs
                    defaultIndex={0} // default = 0
                    style={{ backgroundColor: '#fff' }} // works the same as AppBar in react-native-paper
                    disableSwipe={true} // (default=false) disable swipe to left/right gestures
                    onChangeIndex={(newIndex) => { setSelectedTab(newIndex) }}
                >
                    <TabScreen label="Inventory">
                        <View>
                            <SearchBar />
                            <PlantCards plants={userPlants}/>
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
                <Tabs
                    defaultIndex={0} // default = 0
                    style={{ backgroundColor: '#fff' }} // works the same as AppBar in react-native-paper
                    disableSwipe={true} // (default=false) disable swipe to left/right gestures
                    onChangeIndex={(newIndex) => { setSelectedTab(newIndex) }}
                >
                    <TabScreen label="Inventory">
                        <View>
                            <SearchBar />
                            <PlantCards plants={userPlants}/>
                        </View>
                    </TabScreen>
                    <TabScreen label="Divisions">
                        <Divisions divisions={userDivisions} plants={userPlants} handleUpdate={handleUpdate} />
                    </TabScreen>
                </Tabs>
            }
            <PlusButton index={selectedTab} />
            <BottomMenu screenHeight={screenHeight} active={"leaf"} />
        </View>
    )
}