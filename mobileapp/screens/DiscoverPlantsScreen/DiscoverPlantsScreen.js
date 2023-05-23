import BottomMenu from "../../components/BottomMenu";
import {Dimensions, View} from "react-native";
import React, {useState, useEffect} from "react";
import {useTheme} from "react-native-paper";
import DiscoverNewPlantsHeader from "./components/DiscoverNewPlantsHeader";
import DiscoverNewPlantsSearchBar from "./components/DiscoverNewPlantsSearchBar";
import Categories from "./components/Categories";
import {getCategories} from "../../service/DiscoverPlantsScreenService";

export default function DiscoverPlantsScreen({route}){
    const {anonymous} = route.params;
    const [categories, setCategories] = useState([]);

    useEffect( () => {
        getCategories().then((categories) => {
            if (!anonymous){
                categories.unshift({name: "Suggested", photo: require("../../assets/plant.png"), id: "suggested"});
            }
            setCategories(categories)});
    }, []);

    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    const [hideCategories, setHideCategories] = useState(false)
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <DiscoverNewPlantsHeader/>
            <DiscoverNewPlantsSearchBar anonymous={anonymous} setHideCategories={setHideCategories}/>
            {!hideCategories &&
                <Categories categories={categories} anonymous={anonymous}/>
            }

            <BottomMenu screenHeight={screenHeight} active={"magnify"} anonymous={anonymous}/>
        </View>
    )
}