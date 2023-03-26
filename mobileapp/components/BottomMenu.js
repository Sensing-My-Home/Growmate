import {View} from "react-native";
import {IconButton} from "react-native-paper";
import React from "react";

export default function BottomMenu({screenHeight}){
    return (
        <View style={{width: "100%", backgroundColor:"#9ccc65", height: 65, position: 'absolute',
            top: screenHeight - 110, flexDirection: "row"}}>
            <View style={{position: 'relative', flex: 1, paddingLeft: 20}}>
                <IconButton icon={"leaf"} iconColor={"white"} size={35}/>
            </View>
            <View style={{position: 'relative', flex: 1}}>
                <IconButton icon={"magnify"} iconColor={"#689f38"} size={35}/>
            </View>
            <View style={{position: 'relative', flex: 1}}>
                <IconButton icon={"calendar-month-outline"} iconColor={"#689f38"} size={35}/>
            </View>
            <View style={{position: 'relative', flex: 1}}>
                <IconButton icon={"message-outline"} iconColor={"#689f38"} size={35}/>
            </View>
        </View>
    )
}