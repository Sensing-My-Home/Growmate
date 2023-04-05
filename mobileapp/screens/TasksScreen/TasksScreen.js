import {Dimensions, View} from "react-native";
import GreenBar from "../../components/GreenBar";
import BottomMenu from "../../components/BottomMenu";
import React from "react";
import {useTheme} from "react-native-paper";
import TasksHeader from "./components/TasksHeader";
import Tasks from "./components/Tasks";
import TaskCalendar from "./components/TaskCalendar";

export default function TasksScreen() {
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    const tasks = [
        {weekday: "Wed",
            day: 12,
            tasks: [
                "Beth should be reppoted.",
                "Water Anthony."
            ]
        },
        {weekday: "Sun",
            day: 16,
            tasks: [
                "Beth should be reppoted.",
                "Water Anthony."
            ]
        },
        {weekday: "Fri",
            day: 28,
            tasks: [
                "Different task.",
                "Water Anthony."
            ]
        },
    ]
    const taskDates = {
        '2023-04-12': {marked: true, dotColor: theme.colors.primary},
        '2023-04-16': {marked: true, dotColor: theme.colors.primary},
        '2023-04-28': {marked: true, dotColor: theme.colors.primary},
    }

    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <TasksHeader/>
            <TaskCalendar taskDates={taskDates}/>
            <Tasks tasks={tasks}/>
            <BottomMenu screenHeight={screenHeight} active={"calendar"} />
        </View>
    )
}