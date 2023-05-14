import {useState} from "react"
import {View} from "react-native";
import {Text, TextInput, useTheme} from "react-native-paper";
import {DatePickerInput} from 'react-native-paper-dates';
import DropDown from "react-native-paper-dropdown";

export default function PlantInformation({plant,division, divisions}) {
    const theme = useTheme();

    const [text, setText] = useState(plant.name);

    const [inputDate, setInputDate] = useState(Date.parse(plant.plantationDate));

    const [showDivisions, setShowDivisions] = useState(false);
    const [currentDivision, setCurrentDivision] = useState(division === null ? division : division.id);
    return (
        <View style={{ paddingBottom: 100, paddingHorizontal: 50 }}>
            <Text variant="titleMedium" style={{color: theme.colors.primary}}>{plant.name}'s information:</Text>
            <TextInput
                label="Name"
                value={text}
                onChangeText={text => setText(text)}
                contentStyle={{backgroundColor: theme.colors.background}}
                underlineColor={theme.colors.primary}
            />
            <DatePickerInput
                locale="en-GB"
                label="Plantation Date"
                value={inputDate}
                onChange={(d) => setInputDate(d)}
                inputMode="start"
                contentStyle={{backgroundColor: theme.colors.background}}
            />
            <DropDown
                mode="outlined"
                visible={showDivisions}
                showDropDown={() => setShowDivisions(true)}
                onDismiss={() => setShowDivisions(false)}
                value={currentDivision}
                setValue={setCurrentDivision}
                list={divisions.map((division, index) => ({ label: division.name, value: division.id, key: index }))}
                placeholder="Division"
            />
        </View>
    )
}