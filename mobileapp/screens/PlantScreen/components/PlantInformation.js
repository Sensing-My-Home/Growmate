import { useState } from "react"
import { View } from "react-native";
import { useTheme, TextInput } from "react-native-paper";
import { PaperSelect } from 'react-native-paper-select';

export default function PlantInformation() {
    const theme = useTheme();

    const [text, setText] = useState("")
    const [potSize, setPotSize] = useState({
        value: '',
        list: [
            {_id: '1', value: 'SMALL'},
            {_id: '2', value: 'MEDIUM'},
            {_id: '3', value: 'BIG'},
        ],
        selectedList: [],
        error: '',
    })
    const [division, setDivision] = useState({
        value: '',
        list: [
            {_id: '1', value: 'Living Room'},
            {_id: '2', value: 'Kitchen'},
        ],
        selectedList: [],
        error: '',
    })

    return (
        <View style={{ paddingBottom: 30 }}>
            <TextInput 
                label="Name"
                value={text}
                onChangeText={text => ServerContext(text)}
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
            />
        </View>
    )
}