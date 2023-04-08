import GreenBar from "../../components/GreenBar";
import BottomMenu from "../../components/BottomMenu";
import {Dimensions, ScrollView, View} from "react-native";
import React from "react";
import {useTheme} from "react-native-paper";
import AddPlantHeader from "../AddPlantScreen/components/AddPlantHeader";
import PlantItem from "./components/PlantItem";

export default function CategoryScreen({route}){
    const screenHeight = Dimensions.get('screen').height;
    const {name} = route.params;
    const theme = useTheme()
    const plants = [
        {name: "Lavender", image: require("../../assets/lavender.jpeg"), difficulty: 4},
        {name: "Rosemary", image: require("../../assets/rosemary.webp"), difficulty: 3},
        {name: "Parsley", image: require("../../assets/parsley.jpeg"), difficulty: 3},
        {name: "Thyme", image: require("../../assets/thyme.jpeg"), difficulty: 5},
        {name: "Mint", image: require("../../assets/mint.jpeg"), difficulty: 1},

    ]
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <AddPlantHeader text={name}/>
            <ScrollView style={{maxHeight: screenHeight - screenHeight / 3 + 25}}>
                {plants.map((plant, index) => (
                    <PlantItem
                        key={index}
                        name={plant.name}
                        image={plant.image}
                        difficulty={plant.difficulty}
                    />
                ))}
            </ScrollView>
            <BottomMenu screenHeight={screenHeight} active={"magnify"} />
        </View>
    )
}