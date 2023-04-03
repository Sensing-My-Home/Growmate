import { Card, useTheme } from "react-native-paper";
import React from "react";
import { TouchableOpacity } from "react-native";
import { useNavigation } from '@react-navigation/native';

export default function PlantCard({ name, image }) {
    const navigation = useNavigation();
    const theme = useTheme();

    return (
        <TouchableOpacity
            style={{ width: 150, flex: 1, margin: 8, backgroundColor: theme.colors.background }}
            onPress={() => {
                navigation.navigate("Plant", {
                    name: name,
                    image: image
                });
            }}
        >
            <Card>
                <Card.Cover style={{ height: 150, borderRadius: 0, backgroundColor: theme.colors.background }} source={image} />
                <Card.Title title={name} style={{ backgroundColor: theme.colors.background, borderRadius: 0 }} />
            </Card>
        </TouchableOpacity>
    )
}