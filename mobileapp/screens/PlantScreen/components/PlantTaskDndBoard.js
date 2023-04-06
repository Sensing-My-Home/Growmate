import { useState } from 'react';
import { StyleSheet, View, Dimensions } from 'react-native';
import { DraxProvider, DraxView } from 'react-native-drax';
import { Text, useTheme } from 'react-native-paper';
import TaskCard from './TaskCard';

export default function PlantTaskDndBoard() {
    const theme = useTheme();
    const width = Dimensions.get("window").width;

    const [tasks, setTasks] = useState([
        {
            id: 0,
            name: "Water the plant",
            status: "todo"
        },
        {
            id: 1,
            name: "Change Plant vase",
            status: "todo"
        },
        {
            id: 2,
            name: "Check Plant leafs",
            status: "done"
        }
    ])

    const styles = StyleSheet.create({
        container: {
            flex: 1,
            justifyContent: 'flex-start',
            alignItems: 'center',
            paddingVertical: 30
        },
        receiver: {
            flexGrow: 1,
            width: width,
            rowGap: 10,
            alignItems: "center",
        },
        text: {
            color: theme.colors.primary,
            paddingBottom: 5,
        }
    });

    return (
        <DraxProvider>
            <View style={styles.container}>
                <Text variant="headlineLarge" style={styles.text}>To Do</Text>
                <DraxView
                    style={styles.receiver}
                    onReceiveDragDrop={({ dragged: { payload } }) => {
                        const taskIndex = tasks.findIndex(task => task.id === payload);
                        if (taskIndex >= 0) {
                            const updatedTasks = [...tasks];
                            updatedTasks[taskIndex].status = "todo";
                            setTasks(updatedTasks);
                        }
                    }}
                >
                    {tasks.filter((task) => task.status === "todo").map((task, index) => {
                        return (
                            <DraxView
                                payload={task.id}
                            >
                                <TaskCard name={task.name} key={index} />
                            </DraxView>

                        )
                    })}
                </DraxView>
                <Text variant="headlineLarge" style={styles.text}>Done</Text>
                <DraxView
                    style={styles.receiver}
                    onReceiveDragDrop={({ dragged: { payload } }) => {
                        const taskIndex = tasks.findIndex(task => task.id === payload);
                        if (taskIndex >= 0) {
                            const updatedTasks = [...tasks];
                            updatedTasks[taskIndex].status = "done";
                            setTasks(updatedTasks);
                        }
                    }}
                >
                    {tasks.filter((task) => task.status === "done").map((task, index) => {
                        return (
                            <DraxView
                                style={styles.cardStack}
                                payload={task.id}
                            >
                                <TaskCard name={task.name} key={index} />
                            </DraxView>

                        )
                    })}
                </DraxView>
            </View>
        </DraxProvider>
    )
}