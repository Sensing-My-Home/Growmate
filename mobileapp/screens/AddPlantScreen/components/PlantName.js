import {View} from "react-native";
import {Text, TextInput, useTheme} from "react-native-paper";
import React from "react";

export default function PlantName(){
    const theme = useTheme()
    return (
        <View style={{marginHorizontal: 30, marginTop: 30, alignItems: "center", justifyContent: "center"}}>
            <Text variant={"bodyMedium"} style={{color: theme.colors.primary, marginBottom: 10}}>
                What do you want to name your plant?
            </Text>
            <TextInput style={{ width: 260, backgroundColor: theme.colors.background, fontSize: 14}}
                       underlineColor={theme.colors.primaryContainer}
                       activeUnderlineColor={theme.colors.primary}
                       textColor={theme.colors.onBackground}
                       placeholder={"Plant name"} placeholderTextColor={theme.colors.tertiary}
                       onChangeText={text => console.log(text)}
            />
        </View>
    )
}