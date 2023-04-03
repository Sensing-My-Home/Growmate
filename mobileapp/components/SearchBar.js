import { View } from "react-native";
import { IconButton, TextInput, useTheme } from "react-native-paper";
import React from "react";

export default function SearchBar() {
    const theme = useTheme();

    return (
        <View style={{ marginTop: 20, marginHorizontal: 35, marginBottom: 10, flexDirection: 'row' }}>
            <View style={{ borderRadius: 50 }}>
                <IconButton icon={"magnify"} iconColor={theme.colors.primary} size={35} />
            </View>
            <TextInput style={{ width: 260, backgroundColor: theme.colors.background }}
                underlineColor={theme.colors.primaryContainer}
                activeUnderlineColor={theme.colors.primary}
                textColor={theme.colors.onBackground}
                placeholder={"Search a plant or species!"} placeholderTextColor={theme.colors.secondary}
                onChangeText={text => console.log(text)}
            />
        </View>
    )
}