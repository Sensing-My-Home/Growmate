import React from "react";
import {View, Dimensions} from "react-native";
import BottomMenu from "../components/BottomMenu";
import SearchBar from "../components/SearchBar";
import WelcomeHeader from "../components/WelcomeHeader";
import GreenBar from "../components/GreenBar";
import ThinDivider from "../components/ThinDivider";
import PlantCards from "../components/PlantCards";

export default function HomeScreen(){
    const screenHeight = Dimensions.get('screen').height;
    const plants = [
        { name: 'Wendy', image: require('../assets/plant.jpeg') },
        { name: 'Beth', image: require('../assets/plant2.webp') },
        { name: 'Anthony', image: require('../assets/plant3.jpeg') },
        { name: 'Frederick', image: require('../assets/plant4.jpeg') },
        { name: 'John', image: require('../assets/plant5.jpeg') }
    ];
    return (
        <View style={{height: screenHeight}}>
            <GreenBar/>
            <WelcomeHeader/>
            <ThinDivider/>
            <SearchBar/>
            <PlantCards plants={plants}/>
            <BottomMenu screenHeight={screenHeight}/>
        </View>
    )
}