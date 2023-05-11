import {TouchableOpacity, View} from "react-native";
import {Card, Checkbox, Text, useTheme} from "react-native-paper";
import { updateTask } from '../../../service/PlantScreenService';
import React from "react";

export default function DayTasks({weekday, day, tasks, userId, plantId, taskId, setCounter, counter, setChange, dateString, taskType}){
    const theme = useTheme();
    const [checked, setChecked] = React.useState(false);

    const handleCheckBoxChange = () => {
        setChecked(!checked);
        updateTask(userId, plantId, taskId).then(() => {
                setTimeout( () => {
                    setCounter(counter+1);
                    setChecked(false);},
                500)
            });
    }

    return (
        <View style={{marginBottom: 20}}>
            <View style={{flexDirection: "row"}}>
                <View style={{flexDirection: "column", alignItems: "center", justifyContent: "center", marginRight: 20, width: 60}}>
                    <Text variant={"headlineSmall"} style={{ color: theme.colors.primary, fontWeight: '700'}}>
                        {weekday}
                    </Text>
                    {day === "none" ? null :
                        <Text variant={"bodyMedium"}
                              style={{ color: theme.colors.secondary, fontWeight: '500'}}>
                            {day}
                        </Text>
                    }
                </View>
                <TouchableOpacity onPress={() => {setChange(tasks[0], dateString, taskType, plantId)}}>
                    <Card style={{backgroundColor: theme.colors.background, width: 230}}>
                        <Card.Content style={{flexDirection: "row", justifyContent: "space-between", alignItems: "center"}}>
                            {tasks.map((task, index) => (
                                <Text key={index} variant={"bodyMedium"} style={{width: 160}}>
                                    {task}
                                </Text>
                            ))}
                            <Checkbox
                                status={checked ? 'checked' : 'unchecked'}
                                onPress={() => {
                                    handleCheckBoxChange();

                                }}
                            />
                        </Card.Content>
                    </Card>
                </TouchableOpacity>

            </View>
        </View>
    )
}