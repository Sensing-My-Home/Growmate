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
            <AddPlantHeader text={"Let us know the plant's details"}/>
            <SearchBarSpecies/>
            <AddPhoto/>
            <PlantName/>
            <NextButton text={"Next"} page={"AssociatePlant"} reverse={false}/>
            <BottomMenu screenHeight={screenHeight} active={"leaf"} />
        </View>
    )
}