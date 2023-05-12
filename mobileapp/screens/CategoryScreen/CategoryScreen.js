import GreenBar from "../../components/GreenBar";
import BottomMenu from "../../components/BottomMenu";
import {Dimensions, ScrollView, View} from "react-native";
import React, {useState, useEffect} from "react";
import {useTheme} from "react-native-paper";
import AddPlantHeader from "../AddPlantScreen/components/AddPlantHeader";
import PlantItem from "./components/PlantItem";
import {getCategorySpecies} from "../../service/CategoryScreenService";

export default function CategoryScreen({route}){
    const [species, setSpecies] = useState([]);

    useEffect( () => {
        getCategorySpecies(id).then((species) => {setSpecies(species)});
    }, []);

    const screenHeight = Dimensions.get('screen').height;
    const {name, id} = route.params;
    const theme = useTheme()

    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <AddPlantHeader text={name}/>
            <ScrollView style={{maxHeight: screenHeight - screenHeight / 3 + 25}}>
                {species.map((specie, index) => (
                    <PlantItem
                        key={index}
                        name={specie.commonName}
                        image={specie.speciesPhoto}
                        difficulty={specie.difficulty}
                    />
                ))}
            </ScrollView>
            <BottomMenu screenHeight={screenHeight} active={"magnify"} />
        </View>
    )
}