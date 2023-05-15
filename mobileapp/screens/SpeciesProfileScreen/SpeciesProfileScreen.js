import GreenBar from "../../components/GreenBar";
import BottomMenu from "../../components/BottomMenu";
import {Dimensions, View} from "react-native";
import React, {useEffect, useState} from "react";
import {useTheme} from "react-native-paper";
import SpeciesAvatar from "./components/SpeciesAvatar";
import SpeciesInfo from "./components/SpeciesInfo";
import SpeciesHeader from "./components/SpeciesHeader";
import {getPlantSpeciesInfo, getSpeciesInfo} from "../../service/SpeciesProfileScreenService";
import {userID} from "../../user";

export default function SpeciesProfileScreen({route}){
    const [plantSpeciesInfo, setPlantSpeciesInfo] = useState({});
    const {plantId, specieID, anonymous} = route.params;
    useEffect( () => {
        if (specieID > 0) {
            getSpeciesInfo(specieID).then((info) => {setPlantSpeciesInfo(info)});
        }
        else {
            getPlantSpeciesInfo(userID, plantId).then((info) => {setPlantSpeciesInfo(info)});
        }

    }, [])
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <SpeciesHeader/>
            <SpeciesAvatar speciesFamily={plantSpeciesInfo.scientificName} species={plantSpeciesInfo.commonName} image={plantSpeciesInfo.speciesPhoto}/>
            <SpeciesInfo info={plantSpeciesInfo}/>
            <BottomMenu screenHeight={screenHeight} active={"leaf"} anonymous={anonymous}/>
        </View>
    )
}