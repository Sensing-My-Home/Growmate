import {View} from "react-native";
import {IconButton, TextInput} from "react-native-paper";
import React from "react";

export default function SearchBar(){
    return (
        <View style={{marginTop: 20, marginHorizontal: 35, marginBottom: 10, flexDirection:'row'}}>
            <View style={{borderRadius: 50}}>
                <IconButton icon={"magnify"} iconColor={"#689f38"} size={35}/>
            </View>
            <TextInput style={{width: 260, backgroundColor: 'white'}}
                       underlineColor={"#689f38"}
                       activeUnderlineColor={"#7cb342"}
                       textColor={"black"}
                       placeholder={"Search a plant or species!"} placeholderTextColor={"grey"}
                       onChangeText={text => console.log(text)}
            />
        </View>
    )
}