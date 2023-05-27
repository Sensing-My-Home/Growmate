import { View } from "react-native";
import { IconButton, useTheme } from "react-native-paper";
import React from "react";
import {useNavigation} from "@react-navigation/native";

export default function BottomMenu({ screenHeight, active }) {
    const theme = useTheme();
    const navigation = useNavigation();
    let leafColor = theme.colors.primary;
    let magnifyColor = theme.colors.primary;
    let calendarColor = theme.colors.primary;
    let messageColor = theme.colors.primary;

    switch (active) {
        case "leaf":
            leafColor = theme.colors.background;
            break
        case "magnify":
            magnifyColor = theme.colors.background;
            break
        case "calendar":
            calendarColor = theme.colors.background;
            break
        case "message":
            messageColor = theme.colors.background;
            break
    }




    return (
        <View style={{
            width: "100%", backgroundColor: theme.colors.primaryContainer, height: screenHeight / 13, position: 'absolute',
            bottom: screenHeight/17 , flexDirection: "row"
        }}>
            <View style={{ position: 'relative', flex: 1, paddingLeft: 20 }}>
                <IconButton icon={"leaf"} iconColor={leafColor} size={35}
                            onPress={() => {
                                navigation.navigate("Home");
                            }}/>
            </View>
            <View style={{ position: 'relative', flex: 1 }}>
                <IconButton icon={"magnify"} iconColor={magnifyColor} size={35}
                            onPress={() => {
                                navigation.navigate("DiscoverPlants");
                            }}/>
            </View>
            <View style={{ position: 'relative', flex: 1 }}>
                <IconButton icon={"calendar-month-outline"} iconColor={calendarColor} size={35}
                            onPress={() => {
                                navigation.navigate("Tasks");
                            }}/>
            </View>
            <View style={{ position: 'relative', flex: 1 }}>
                <IconButton icon={"message-outline"} iconColor={messageColor} size={35} />
            </View>
        </View>
    )
}