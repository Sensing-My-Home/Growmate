import { View } from "react-native";
import { Text, IconButton, useTheme } from "react-native-paper";
import React from "react";
import { useNavigation } from '@react-navigation/native';

export default function SpeciesHeader() {
    const navigation = useNavigation();
    const theme = useTheme();

    return (
        <View style={{ marginTop: 10, marginBottom: 5, flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-start' }}>
            <View style={{ flex: 1 }}>
                <IconButton
                    icon='chevron-left'
                    size={35}
                    iconColor={theme.colors.primary}
                    onPress={() => {
                        navigation.goBack();
                    }}
                />
            </View>
            <View style={{ flex: 4 }}>
                <Text variant={"headlineMedium"} style={{ color: theme.colors.primary, fontWeight: '700', textAlign: 'center' }}>Species Information</Text>
            </View>
            <View style={{ flex: 1 }} />
        </View>
    )
}