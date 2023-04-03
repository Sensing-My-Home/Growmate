import { View } from "react-native";
import { IconButton, Text, useTheme } from "react-native-paper";
import React from "react";

export default function WelcomeHeader() {
    const theme = useTheme();

    return (
        <View style={{ marginTop: 25, marginHorizontal: 40, marginBottom: 10, flexDirection: 'row' }}>
            <View style={{ paddingEnd: 70, paddingTop: 10 }}>
                <Text variant={"headlineMedium"} style={{ color: theme.colors.primary, fontWeight: '700' }}>Welcome, User!</Text>
            </View>
            <View style={{ borderRadius: 50, backgroundColor: theme.colors.primaryContainer, borderWidth: 0 }}>
                <IconButton icon={"account"} iconColor={theme.colors.secondary} size={25} />
            </View>
        </View>
    )
}