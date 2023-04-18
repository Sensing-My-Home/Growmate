import {View} from "react-native";
import {Text} from "react-native-paper";
import DropDown from "react-native-paper-dropdown";
import React, {useState} from "react";

export default function SensorDropdown({theme, type, options}){
    const [showDropDown, setShowDropDown] = useState(false);
    const [sensorTarget, setSensorTarget] = useState("");

    return (
        <View style={{marginTop: 20}}>
            <View style={{marginHorizontal: 50}}>
                <Text variant={"bodyLarge"} style={{ color: theme.colors.primary }}>Sensor {type}</Text>
            </View>
            <View style={{marginHorizontal: 50}}>
                <DropDown
                    mode={"outlined"}
                    visible={showDropDown}
                    showDropDown={() => setShowDropDown(true)}
                    onDismiss={() => setShowDropDown(false)}
                    value={sensorTarget}
                    setValue={setSensorTarget}
                    list={options.map((name, index) => ({ label: name, value: name, key: index.toString() }))}
                    placeholder={"Select a sensor"}
                />
            </View>
        </View>
    )
}