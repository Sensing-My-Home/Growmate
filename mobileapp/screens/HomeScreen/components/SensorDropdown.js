import { useState } from "react";
import { View, Dimensions } from "react-native";
import { Text, useTheme } from "react-native-paper";
import DropDown from "react-native-paper-dropdown";

export default function SensorDropdown({ value, setValue, list, label }) {
    const theme = useTheme();
    const [showDropdown, setShowDropdown] = useState(false);
    const screenWidth = Dimensions.get("screen").width;

    return (
        <View>
            <View style={{ marginLeft: 16, width: screenWidth - 100 }}>
                <View style={{ marginBottom: 5 }}>
                    <Text variant="bodyLarge">Select {label}:</Text>
                </View>
                <DropDown
                    label={label}
                    mode="outlined"
                    visible={showDropdown}
                    showDropDown={() => setShowDropdown(true)}
                    onDismiss={() => setShowDropdown(false)}
                    value={value}
                    setValue={setValue}
                    list={list}
                />
            </View>
        </View>
    )
}