import {ScrollView, View} from "react-native";
import {TextInput, useTheme} from "react-native-paper";
import React from "react";
import SensorDropdown from "./SensorDropdown";

export default function DivisionInfo({sensors, setName, setSensors}){
    const theme = useTheme();
    const sensors_static = [
        {
            type: "temperature",
            options: ["None", "Sensor temperature 1", "Sensor temperature 2"]
        },
        {
            type: "air humidity",
            options: ["None", "Sensor air humidity 1", "Sensor air humidity 2"]
        },
    ]
    return (
        <View style={{marginTop: 60, marginBottom: 30}}>
            <TextInput style={{ width: 300, backgroundColor: theme.colors.background, fontSize: 14, marginLeft: 50, marginBottom: 10}}
                       underlineColor={theme.colors.primaryContainer}
                       activeUnderlineColor={theme.colors.primary}
                       textColor={theme.colors.onBackground}
                       placeholder={"Division name"} placeholderTextColor={theme.colors.tertiary}
                       onChangeText={text => setName(text)}
            />
            <ScrollView style={{maxHeight: 250}}>
            {sensors_static.map((sensor, index) => (
                    <SensorDropdown theme={theme} type={sensor.type} options={sensor.options} key={index}/>
                ))}
            </ScrollView>
        </View>
    )
}