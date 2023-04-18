import {Dimensions, View} from "react-native";
import {StackActions, useNavigation} from "@react-navigation/native";
import {useTheme} from "react-native-paper";
import GreenBar from "../../components/GreenBar";
import React, {useState} from "react";
import AddPlantHeader from "../AddPlantScreen/components/AddPlantHeader";
import BottomMenu from "../../components/BottomMenu";
import NextButton from "../AddPlantScreen/components/NextButton";
import AddDivisionDescription from "./components/AddDivisionDescription";
import DivisionInfo from "./components/DivisionInfo";


export default function AddDivisionScreen(){
    const screenHeight = Dimensions.get('screen').height;
    const navigation = useNavigation();
    const theme = useTheme()
    const [divisionName, setDivisionName] = useState();
    const onPressNext = () => {
        navigation.dispatch(StackActions.replace('Home'));
    }

    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <AddPlantHeader text={"Add a Division to your home!"}/>
            <AddDivisionDescription/>
            <DivisionInfo setName={setDivisionName}/>
            <NextButton text={"CREATE"} reverse={true} onPress={onPressNext}/>
            <BottomMenu screenHeight={screenHeight} active={"leaf"} />
        </View>
    )
}