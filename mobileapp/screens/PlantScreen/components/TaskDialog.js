import {Button, Dialog, Text, TextInput, useTheme, Switch} from "react-native-paper";
import React, {useState} from "react";
import {View} from "react-native";


export default function TaskDialog({visibleChange, hideChange, taskName, taskDueDate, taskMode, taskFrequency, setTaskDueDate, setTaskMode, setTaskFrequency}) {
    const theme = useTheme();
    const [editTask, setEditTask] = useState(false)

    return (
        <Dialog visible={visibleChange} onDismiss={hideChange} style={{ backgroundColor: theme.colors.background }}>
            <Dialog.Content>
                <Text variant={"bodyLarge"} style={{textAlign: "center", marginBottom: 15, color: theme.colors.primary}}>{taskName}</Text>
                    {editTask ?
                        <View>
                            <View style={{flexDirection: "row", marginBottom: 10, marginHorizontal: 30, alignItems: "center", justifyContent: "space-between"}}>
                                <Text variant={"bodyMedium"}>Due date: </Text>
                                <TextInput
                                value={taskDueDate}
                                onChangeText={text => setTaskDueDate(text)}
                                contentStyle={{backgroundColor: theme.colors.background}}
                                underlineColor={theme.colors.primary}/>
                            </View>
                            <View style={{flexDirection: "row", marginBottom: 10, marginHorizontal: 30, alignItems: "center", justifyContent: "space-between"}}>
                                <Text variant={"bodyMedium"}>Automatic Mode: </Text>
                                <Switch value={taskMode} onValueChange={() => {setTaskMode(!taskMode)}} style={{ transform: [{ scaleX: 1.2 }, { scaleY: 1.3 }] }}
                                />
                            </View>
                            {taskMode === false &&
                                <View style={{flexDirection: "row", marginBottom: 10, marginHorizontal: 30, alignItems: "center", justifyContent: "space-between"}}>
                                    <Text variant={"bodyMedium"}>Task frequency: </Text>
                                    <TextInput
                                        value={taskFrequency.toString()}
                                        onChangeText={text => setTaskFrequency(parseInt(text))}
                                        contentStyle={{backgroundColor: theme.colors.background}}
                                        underlineColor={theme.colors.primary}/>
                                </View>
                            }
                        </View>
                        :
                        <View>
                            <View style={{flexDirection: "row", marginBottom: 10, marginHorizontal: 30, alignItems: "center", justifyContent: "space-between"}}>
                                <Text variant={"bodyMedium"}>Due date: </Text>
                                <Text variant={"bodyMedium"}>{taskDueDate}</Text>
                            </View>
                            <View style={{flexDirection: "row", marginBottom: 10, marginHorizontal: 30, alignItems: "center", justifyContent: "space-between"}}>
                                <Text variant={"bodyMedium"}>Automatic Mode: </Text>
                                <Switch disabled={true} value={taskMode} onValueChange={() => {setTaskMode(!taskMode)}} style={{ transform: [{ scaleX: 1.2 }, { scaleY: 1.3 }] }}
                                />
                            </View>
                            {taskMode === false &&
                                <View style={{flexDirection: "row", marginBottom: 10, marginHorizontal: 30, alignItems: "center", justifyContent: "space-between"}}>
                                    <Text variant={"bodyMedium"}>Task frequency: </Text>
                                    <TextInput
                                        value={taskFrequency.toString()}
                                        onChangeText={text => setTaskFrequency(parseInt(text))}
                                        contentStyle={{backgroundColor: theme.colors.background}}
                                        underlineColor={theme.colors.primary}/>
                                </View>
                            }
                        </View>
                    }

            </Dialog.Content>
            <Dialog.Actions>
                {editTask ?
                    <Button onPress={() => {setEditTask(false)}} style={{width: 50}} buttonColor={theme.colors.primary} textColor={theme.colors.background}>Save</Button>
                    :
                    <Button onPress={() => {setEditTask(true)}} style={{width: 50}} buttonColor={theme.colors.secondary} textColor={theme.colors.background}>Edit</Button>

                }
            </Dialog.Actions>
        </Dialog>
    )
}