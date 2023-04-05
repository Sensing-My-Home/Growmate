import GreenBar from "../../components/GreenBar";
import BottomMenu from "../../components/BottomMenu";
import {Dimensions, View} from "react-native";
import React from "react";
import {useTheme} from "react-native-paper";
import SpeciesAvatar from "./components/SpeciesAvatar";
import SpeciesInfo from "./components/SpeciesInfo";
import SpeciesFooter from "./components/SpeciesFooter";
import SpeciesHeader from "./components/SpeciesHeader";

export default function SpeciesProfileScreen({route}){
    const {species} = route.params;
    const speciesImage = require('../../assets/aloe-vera-closeup.jpeg');
    const speciesFamily = "Barbados aloe"
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    const info = {
        temperature: "Warm",
        cicle: "Perenial",
        sunlight: "Sunny light areas",
        difficulty: 2,
        humidity: "Low",
        plantType: "Cactus",
        waterFreq: "Soil should be dry before watering again",
        soilMix: "Well-drained commercial potting mix"
    }
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <SpeciesHeader/>
            <SpeciesAvatar speciesFamily={speciesFamily} species={species} image={speciesImage}/>
            <SpeciesInfo info={info}/>
            <SpeciesFooter/>
            <BottomMenu screenHeight={screenHeight} active={"leaf"} />
        </View>
    )
}