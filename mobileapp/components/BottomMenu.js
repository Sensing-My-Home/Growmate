import { View } from "react-native";
import { IconButton, useTheme } from "react-native-paper";
import React from "react";

export default function BottomMenu({ screenHeight }) {
    const theme = useTheme();

    return (
        <View style={{
            width: "100%", backgroundColor: theme.colors.primaryContainer, height: screenHeight / 13, position: 'absolute',
            bottom: screenHeight/17 , flexDirection: "row"
        }}>
            <View style={{ position: 'relative', flex: 1, paddingLeft: 20 }}>
                <IconButton icon={"leaf"} iconColor={theme.colors.background} size={35} />
            </View>
            <View style={{ position: 'relative', flex: 1 }}>
                <IconButton icon={"magnify"} iconColor={theme.colors.primary} size={35} />
            </View>
            <View style={{ position: 'relative', flex: 1 }}>
                <IconButton icon={"calendar-month-outline"} iconColor={theme.colors.primary} size={35} />
            </View>
            <View style={{ position: 'relative', flex: 1 }}>
                <IconButton icon={"message-outline"} iconColor={theme.colors.primary} size={35} />
            </View>
        </View>
    )
}