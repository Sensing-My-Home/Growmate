import {TouchableOpacity, View} from "react-native";
import {Text, Card, useTheme} from "react-native-paper";
import React from "react";


export default function CategoryCard({name, image}){
    const theme = useTheme();
    const width = 100;
    const height = 100;
    return (
        <TouchableOpacity>
        <View style={{alignItems: "center", justifyContent: "center", width: width, height: height+30, margin: 10}}>

            <Card style={{width: width, height: height}} >
                <Card.Cover source={image} style={{width: width, height: height}} />
            </Card>
            <Text variant={"bodyMedium"} style={{color: theme.colors.primary, marginTop: 6, height: 40}}>{name}</Text>
        </View>
        </TouchableOpacity>
    )
}