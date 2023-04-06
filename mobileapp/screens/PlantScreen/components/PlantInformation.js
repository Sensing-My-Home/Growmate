import { useState } from "react"
import { View } from "react-native";
import { useTheme, TextInput, Text } from "react-native-paper";
import { PaperSelect } from 'react-native-paper-select';
import { DatePickerInput } from 'react-native-paper-dates';

export default function PlantInformation({name}) {
    const theme = useTheme();

    const [text, setText] = useState("")

    const [potSize, setPotSize] = useState({
        value: '',
        list: [
            { _id: '1', value: 'SMALL' },
            { _id: '2', value: 'MEDIUM' },
            { _id: '3', value: 'BIG' },
        ],
        selectedList: [],
        error: '',
    })

    const [division, setDivision] = useState({
        value: '',
        list: [
            { _id: '1', value: 'Living Room' },
            { _id: '2', value: 'Kitchen' },
        ],
        selectedList: [],
        error: '',
    })

    const [inputDate, setInputDate] = useState(undefined)

    const [sensor, setSensor] = useState({
        value: '',
        list: [
            { _id: '1', value: 'Temperature' },
            { _id: '2', value: 'Air Humidity' },
            { _id: '3', value: 'Soil Humidity' },
        ],
        selectedList: [],
        error: '',
    })

    return (
        <View style={{ paddingBottom: 30, paddingHorizontal: 50 }}>
            <Text variant="titleMedium" style={{color: theme.colors.primary}}>{name}'s information:</Text>
            <TextInput
                label="Name"
                value={text}
                onChangeText={text => setText(text)}
                contentStyle={{backgroundColor: theme.colors.background}}
                underlineColor={theme.colors.primary}
            />
            <PaperSelect
                label="Pot Size"
                value={potSize.value}
                onSelection={(value) => {
                    setPotSize({
                        ...potSize,
                        value: value.text,
                        selectedList: value.selectedList,
                        error: '',
                    });
                }}
                arrayList={[...potSize.list]}
                selectedArrayList={[...potSize.selectedList]}
                errorText={potSize.error}
                multiEnable={false}
                hideSearchBox={true}
                textInputBackgroundColor={theme.colors.background}
                underlineColor={theme.colors.primary}
                activeUnderlineColor={theme.colors.primary}
                textInputMode="flat"
                checkboxColor={theme.colors.primary}
            />
            <PaperSelect
                label="Division"
                value={division.value}
                onSelection={(value) => {
                    setDivision({
                        ...division,
                        value: value.text,
                        selectedList: value.selectedList,
                        error: '',
                    });
                }}
                arrayList={[...division.list]}
                selectedArrayList={[...division.selectedList]}
                errorText={division.error}
                multiEnable={false}
                hideSearchBox={true}
                textInputBackgroundColor={theme.colors.background}
                underlineColor={theme.colors.primary}
                activeUnderlineColor={theme.colors.primary}
                textInputMode="flat"
                checkboxColor={theme.colors.primary}
            />
            <DatePickerInput
                locale="en"
                label="Plantation Date"
                value={inputDate}
                onChange={(d) => setInputDate(d)}
                inputMode="start"
                contentStyle={{backgroundColor: theme.colors.background}}
            />
            <PaperSelect
                label="Sensor"
                value={sensor.value}
                onSelection={(value) => {
                    setSensor({
                        ...sensor,
                        value: value.text,
                        selectedList: value.selectedList,
                        error: '',
                    });
                }}
                arrayList={[...sensor.list]}
                selectedArrayList={[...sensor.selectedList]}
                errorText={sensor.error}
                multiEnable={false}
                hideSearchBox={true}
                textInputBackgroundColor={theme.colors.background}
                underlineColor={theme.colors.primary}
                activeUnderlineColor={theme.colors.primary}
                textInputMode="flat"
                checkboxColor={theme.colors.primary}
            />
        </View>
    )
}