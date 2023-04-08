import React, {useState} from "react";
import { View, Dimensions } from "react-native";
import BottomMenu from "../../components/BottomMenu";
import GreenBar from "../../components/GreenBar";
import {useTheme} from "react-native-paper";
import AddPlantHeader from "../AddPlantScreen/components/AddPlantHeader";
import NextButton from "../AddPlantScreen/components/NextButton";
import AssociateSensor from "./components/AssociateSensor";
import AssociateDivision from "./components/AssociateDivision";
import AddSensorButton from "./components/AddSensorButton";
import AddDivisionButton from "./components/AddDivisionButton";


export default function AssociatePlantScreen() {
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    const divisions = ["None", "Balcony", "Kitchen"];
    const humiditySensors = ["None", "Sensor humidity 1", "Sensor humidity 2"];
    const [showHumidityDropDown, setShowHumidityDropDown] = useState(false);
    const [humiditySensorTarget, setHumiditySensorTarget] = useState("None");
    const [showDivisionDropDown, setShowDivisionDropDown] = useState(false);
    const [divisionTarget, setDivisionTarget] = useState("None");

    // API call that onPress it adds a Plant;
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <AddPlantHeader text={"Just a few more steps!"}/>
            <AssociateSensor humiditySensors={humiditySensors} humidityProps={[showHumidityDropDown, setShowHumidityDropDown, humiditySensorTarget, setHumiditySensorTarget]}/>
            <AddSensorButton/>
            <AssociateDivision divisions={divisions} divisionsProps={[showDivisionDropDown, setShowDivisionDropDown, divisionTarget, setDivisionTarget ]}/>
            <AddDivisionButton/>
            <NextButton text={"CREATE"} reverse={true} page={"Home"}/>
            <BottomMenu screenHeight={screenHeight} active={"leaf"} />
        </View>
    )
}