import { View } from "react-native";
import { Text, IconButton } from "react-native-paper";
import React from "react";
import { useNavigation } from '@react-navigation/native';

export default function PlantHeader({ name }) {
    const navigation = useNavigation();

    return (
        <View style={{ marginTop: 25, marginBottom: 10, flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-start'}}>
            <View style={{flex: 1}}>
                <IconButton
                    icon='chevron-left'
                    size={35}
                    iconColor="#689f38"
                    onPress={() => {
                        navigation.goBack();
                    }}
                />
            </View>
            <View style={{flex: 4}}>
                <Text variant={"headlineMedium"} style={{ color: "#689f38", fontWeight: '700', textAlign: 'center'}}>{name}</Text>
            </View>
            <View style={{flex: 1}}/>
        </View>
    )
}