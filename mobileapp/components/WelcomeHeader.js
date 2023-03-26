import {View} from "react-native";
import {IconButton, Text} from "react-native-paper";
import React from "react";

export default function WelcomeHeader(){
    return(
        <View style={{marginTop: 25, marginHorizontal: 40, marginBottom: 10, flexDirection:'row'}}>
            <View style={{paddingEnd: 70, paddingTop: 10}}>
                <Text variant={"headlineMedium"} style={{color: "#689f38", fontWeight: '700'}}>Welcome, User!</Text>
            </View>
            <View style={{borderRadius: 50, backgroundColor: '#9ccc65', borderWidth: 0}}>
                <IconButton icon={"account"} iconColor={"grey"} size={25}/>
            </View>
        </View>
    )
}