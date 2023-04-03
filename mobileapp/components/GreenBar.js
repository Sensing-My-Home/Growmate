import {View} from "react-native";
import React from "react";
import { useTheme } from 'react-native-paper';

export default function GreenBar(){
    const theme = useTheme();

    return (
        <View style={{height: 35, width: '100%', backgroundColor: theme.colors.primaryContainer}}></View>
    )
}