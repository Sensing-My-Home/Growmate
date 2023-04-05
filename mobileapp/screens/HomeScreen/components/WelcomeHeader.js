import { View } from "react-native";
import { IconButton, Text, useTheme } from "react-native-paper";
import React from "react";
import DropdownButton from "./DropdownButton";
import ThinDivider from "../../../components/ThinDivider";

export default function WelcomeHeader({premium}) {
    const theme = useTheme();

    return (
        <View style={{marginBottom: 10}}>
        <View style={{ marginTop: 25, marginHorizontal: 30, flexDirection: 'row', justifyContent: 'space-between' }}>
            <View style={{ height: 50}}>
                {premium ?
                    <View style={{ flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-start' }}>
                        <Text variant={"headlineMedium"} style={{ color: theme.colors.primary, fontWeight: '700' }}>Welcome, User! </Text>
                        <IconButton icon={"leaf"} iconColor={theme.colors.golden} size={30} />
                    </View>
                    :
                    <Text variant={"headlineMedium"} style={{ color: theme.colors.primary, fontWeight: '700', textAlign: 'left', paddingTop: 11 }}>Welcome, User!</Text>
                                    }
            </View>
            <DropdownButton theme={theme}></DropdownButton>
        </View>
        <ThinDivider />
        </View>
    )
}