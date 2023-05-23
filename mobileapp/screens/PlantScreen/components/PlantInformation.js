import { useState, useEffect } from "react"
import { View } from "react-native";
import { Text, TextInput, useTheme, Button } from "react-native-paper";
import { DatePickerInput } from 'react-native-paper-dates';

export default function PlantInformation({ plant, division, handleSave }) {
    const theme = useTheme();

    // Form
    const [text, setText] = useState(plant.name);
    const [inputDate, setInputDate] = useState(Date.parse(plant.plantationDate));
    const [currentDivision, setCurrentDivision] = useState(division === null ? "None" : division.name);

    useEffect(() => {
        setText(plant.name);
        setInputDate(Date.parse(plant.plantationDate));
        if (division === null) {
            setCurrentDivision("None");
        }
        else {
            setCurrentDivision(division.name);
        }
    }, [plant, division]);

    return (
        <View style={{ paddingBottom: 100, paddingHorizontal: 50 }}>
            <Text variant="titleMedium" style={{ color: theme.colors.primary }}>{plant.name}'s information:</Text>
            <TextInput
                label="Name"
                value={text}
                onChangeText={text => setText(text)}
                contentStyle={{ backgroundColor: theme.colors.background }}
                underlineColor={theme.colors.primary}
            />
            <DatePickerInput
                locale="en-GB"
                label="Plantation Date"
                value={inputDate}
                onChange={(d) => setInputDate(d)}
                inputMode="start"
                contentStyle={{ backgroundColor: theme.colors.background }}
            />
            <TextInput
                label="Division"
                value={currentDivision}
                contentStyle={{ backgroundColor: theme.colors.background }}
                underlineColor={theme.colors.primary}
                disabled
            />
            <Button
                mode="contained"
                onPress={() => handleSave(text, inputDate, currentDivision)}
                style={{ marginTop: 20, backgroundColor: theme.colors.primary }}
            >
                Save
            </Button>
        </View>
    )
}