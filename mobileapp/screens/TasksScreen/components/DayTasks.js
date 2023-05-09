import {ScrollView, TouchableOpacity, View} from "react-native";
import {Avatar, Button, Card, Checkbox, Dialog, Searchbar, Text, useTheme} from "react-native-paper";
import { updateTask } from '../../../service/PlantScreenService';
import React, {useState} from "react";

export default function DayTasks({weekday, day, tasks, userId, plantId, taskId, setCounter, counter, setChange}){
    const theme = useTheme();
    const [checked, setChecked] = React.useState(false);

    const handleCheckBoxChange = () => {
        setChecked(!checked);
        updateTask(userId, plantId, taskId, !checked).then(() => {
                setCounter(counter+1);
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
                <TouchableOpacity onPress={setChange}>
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