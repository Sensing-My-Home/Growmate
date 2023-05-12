import {Dimensions, View} from "react-native";
import {useTheme} from "react-native-paper";
import GreenBar from "../../components/GreenBar";
import React from "react";
import Logo from "./components/Logo";
import SignUp from "./components/SignUp";
import LogIn from "./components/LogIn";
import NoAccount from "./components/NoAccount";


export default function InitializerScreen(){
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <Logo/>
            <LogIn/>
            <SignUp/>
            <NoAccount/>
        </View>
    )
}