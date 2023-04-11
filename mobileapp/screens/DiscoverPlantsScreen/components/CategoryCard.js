import {TouchableOpacity, View} from "react-native";
import {Text, Card, useTheme} from "react-native-paper";
import React from "react";
import {useNavigation} from "@react-navigation/native";


export default function CategoryCard({name, image, id}){
    const theme = useTheme();
    const width = 100;
    const height = 100;
    const navigation = useNavigation();
    return (
        <TouchableOpacity onPress={() => {
            navigation.navigate("Category", {
                name: name,
                id: id
            })
        }
        }>
        <View style={{alignItems: "center", justifyContent: "center", width: width, height: height+30, margin: 10}}>

            <Card style={{width: width, height: height}} >
                <Card.Cover source={ {uri: image } } style={{width: width, height: height}} />
            </Card>
            <Text variant={"bodyMedium"} style={{color: theme.colors.primary, marginTop: 6, height: 40, textAlign: "center"}}>{name}</Text>
        </View>
        </TouchableOpacity>
    )
}