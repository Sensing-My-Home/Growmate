import {View} from "react-native";
import {DatePickerInput} from "react-native-paper-dates";
import {Text, useTheme} from "react-native-paper";
import React from "react";


export default function AddPlantationDate({inputDate, setInputDate}){
    const theme = useTheme();
    return (
        <View style={{marginHorizontal: 30, marginTop: 10, marginBottom: 10}}>
            <Text variant={"titleMedium"} style={{color: theme.colors.primary, fontWeight: "600", marginLeft: 30}}>
                Add plantation date:
            </Text>
            <View>
                <DatePickerInput
                    locale="en"
                    label="Plantation Date"
                    value={inputDate}
                    onChange={(d) => setInputDate(d)}
                    inputMode="start"
                    contentStyle={{backgroundColor: theme.colors.background}}
                />
            </View>

        </View>
    )
}