import React from "react";
import { View, Dimensions } from "react-native";
import BottomMenu from "../../components/BottomMenu";
import GreenBar from "../../components/GreenBar";
import AddPlantHeader from "./components/AddPlantHeader";
import {useTheme} from "react-native-paper";
import SearchBarSpecies from "./components/SearchBarSpecies";
import AddPhoto from "./components/AddPhoto";
import PlantName from "./components/PlantName";
import NextButton from "./components/NextButton";


export default function AddPlantScreen() {
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <AddPlantHeader/>
            <SearchBarSpecies/>
            <AddPhoto/>
            <PlantName/>
            <NextButton/>
            <BottomMenu screenHeight={screenHeight} active={"leaf"} />
        </View>
    )
}