import {Card} from "react-native-paper";
import React from "react";
import {TouchableOpacity} from "react-native";

export default function PlantCard({name, image}){
    return (
        <TouchableOpacity style={{width: 150, flex:1, margin: 8, backgroundColor: "white"}}>
            <Card>
                <Card.Cover style={{height: 150, borderRadius: 0, backgroundColor: "white"}} source={image}/>
                <Card.Title title={name} style={{backgroundColor: 'white', borderRadius: 0}}/>
            </Card>
        </TouchableOpacity>
    )
}