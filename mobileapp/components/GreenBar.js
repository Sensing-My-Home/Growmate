import {Dimensions, View} from "react-native";
import React from "react";
import { useTheme } from 'react-native-paper';

export default function GreenBar(){
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme();

    return (
        <View style={{height: screenHeight / 25, width: '100%', backgroundColor: theme.colors.primaryContainer}}></View>
    )
}