import GreenBar from "../../components/GreenBar";
import BottomMenu from "../../components/BottomMenu";
import {Dimensions, View} from "react-native";
import React, {useState, useEffect} from "react";
import {useTheme} from "react-native-paper";
import DiscoverNewPlantsHeader from "./components/DiscoverNewPlantsHeader";
import DiscoverNewPlantsSearchBar from "./components/DiscoverNewPlantsSearchBar";
import Categories from "./components/Categories";
import {getCategories} from "../../service/DiscoverPlantsScreenService";

export default function DiscoverPlantsScreen(){
    const [categories, setCategories] = useState([]);

    useEffect( () => {
        getCategories().then((categories) => {setCategories(categories)});
    }, []);

    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <DiscoverNewPlantsHeader/>
            <DiscoverNewPlantsSearchBar/>
            <Categories categories={categories}/>
            <BottomMenu screenHeight={screenHeight} active={"magnify"} />
        </View>
    )
}