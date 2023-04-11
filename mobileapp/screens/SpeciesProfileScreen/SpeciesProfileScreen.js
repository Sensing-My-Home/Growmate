import GreenBar from "../../components/GreenBar";
import BottomMenu from "../../components/BottomMenu";
import {Dimensions, View} from "react-native";
import React, {useEffect, useState} from "react";
import {useTheme} from "react-native-paper";
import SpeciesAvatar from "./components/SpeciesAvatar";
import SpeciesInfo from "./components/SpeciesInfo";
import SpeciesFooter from "./components/SpeciesFooter";
import SpeciesHeader from "./components/SpeciesHeader";
import {getPlantSpeciesInfo} from "../../service/SpeciesProfileScreenService";

export default function SpeciesProfileScreen({route}){
    const [plantSpeciesInfo, setPlantSpeciesInfo] = useState({});
    useEffect( () => {
        const {plantId} = route.params;
        getPlantSpeciesInfo(1, plantId).then((info) => {setPlantSpeciesInfo(info)});
    }, [])
    const speciesImage = require('../../assets/aloe-vera-closeup.jpeg');
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <SpeciesHeader/>
            <SpeciesAvatar speciesFamily={plantSpeciesInfo.scientificName} species={plantSpeciesInfo.commonName} image={plantSpeciesInfo.speciesPhoto}/>
            <SpeciesInfo info={plantSpeciesInfo}/>
            <SpeciesFooter/>
            <BottomMenu screenHeight={screenHeight} active={"leaf"} />
        </View>
    )
}