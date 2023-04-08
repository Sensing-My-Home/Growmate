import GreenBar from "../../components/GreenBar";
import BottomMenu from "../../components/BottomMenu";
import {Dimensions, View} from "react-native";
import React from "react";
import {useTheme} from "react-native-paper";
import DiscoverNewPlantsHeader from "./components/DiscoverNewPlantsHeader";
import DiscoverNewPlantsSearchBar from "./components/DiscoverNewPlantsSearchBar";
import Categories from "./components/Categories";

export default function DiscoverPlantsScreen(){
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <DiscoverNewPlantsHeader/>
            <DiscoverNewPlantsSearchBar/>
            <Categories/>
            <BottomMenu screenHeight={screenHeight} active={"magnify"} />
        </View>
    )
}