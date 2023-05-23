import React, { useState } from "react";
import { View, Dimensions } from "react-native";
import BottomMenu from "../../components/BottomMenu";
import GreenBar from "../../components/GreenBar";
import AddPlantHeader from "./components/AddPlantHeader";
import { useTheme } from "react-native-paper";
import SearchBarSpecies from "./components/SearchBarSpecies";
import AddPhoto from "./components/AddPhoto";
import PlantName from "./components/PlantName";
import NextButton from "./components/NextButton";
import AddPlantationDate from "./components/AddPlantationDate";
import { useNavigation } from "@react-navigation/native";


export default function AddPlantScreen() {
    const screenHeight = Dimensions.get('screen').height;
    const navigation = useNavigation();
    const theme = useTheme()
    const [image, setImage] = useState(null);
    const [date, setDate] = useState("")
    const [specie, setSpecie] = useState("");
    const [specieId, setSpecieId] = useState("");
    const [name, setName] = useState("");
    let formattedDate;
    const onPressNext = () => {
        if (date !== "") {
            let dateFullYear = date.getFullYear().toString();
            let month;

            if (date.getMonth() + 1 < 10) {
                month = "0" + (date.getMonth() + 1).toString();
            }
            else {
                month = (date.getMonth() + 1).toString();
            }

            let day;

            if (date.getDate() < 10) {
                day = "0" + date.getDate().toString();
            }
            else {
                day = date.getDate().toString();
            }

            formattedDate = dateFullYear + "-" + month + "-" + day
        } else {
            formattedDate = null;
        }

        navigation.navigate("AssociatePlant", {
            image: image,
            date: formattedDate,
            specie: specieId,
            name: name,
        });
    }
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <AddPlantHeader text={"Let us know the plant's details"} />
            <SearchBarSpecies inputValue={specie} setInputValue={setSpecie} setSpecieId={setSpecieId} />
            <AddPhoto image={image} setImage={setImage} plant={true}/>
            <AddPlantationDate inputDate={date} setInputDate={setDate} />
            <PlantName isImage={image} setName={setName} />
            <NextButton text={"Next"} page={"AssociatePlant"} reverse={false} onPress={onPressNext} />
            <BottomMenu screenHeight={screenHeight} active={"leaf"} />
        </View>
    )
}