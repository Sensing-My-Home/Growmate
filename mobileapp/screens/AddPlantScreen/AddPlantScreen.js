import React, {useState} from "react";
import { View, Dimensions } from "react-native";
import BottomMenu from "../../components/BottomMenu";
import GreenBar from "../../components/GreenBar";
import AddPlantHeader from "./components/AddPlantHeader";
import {useTheme} from "react-native-paper";
import SearchBarSpecies from "./components/SearchBarSpecies";
import AddPhoto from "./components/AddPhoto";
import PlantName from "./components/PlantName";
import NextButton from "./components/NextButton";
import AddPlantationDate from "./components/AddPlantationDate";


export default function AddPlantScreen() {
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    const [image, setImage] = useState(null);
    const [inputDate, setInputDate] = useState(undefined)
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <AddPlantHeader text={"Let us know the plant's details"}/>
            <SearchBarSpecies/>
            <AddPhoto image={image} setImage={setImage}/>
            <AddPlantationDate inputDate={inputDate} setInputDate={setInputDate}/>
            <PlantName isImage={image}/>
            <NextButton text={"Next"} page={"AssociatePlant"} reverse={false}/>
            <BottomMenu screenHeight={screenHeight} active={"leaf"} />
        </View>
    )
}