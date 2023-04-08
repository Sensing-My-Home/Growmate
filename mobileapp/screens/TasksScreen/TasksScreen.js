import {Dimensions, View} from "react-native";
import GreenBar from "../../components/GreenBar";
import BottomMenu from "../../components/BottomMenu";
import React, {useState} from "react";
import {useTheme} from "react-native-paper";
import TasksHeader from "./components/TasksHeader";
import Tasks from "./components/Tasks";
import TaskCalendar from "./components/TaskCalendar";
import GoBackButton from "./components/GoBackButton";

export default function TasksScreen() {
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    const tasks = [
        {weekday: "Wed",
            day: 12,
            tasks: [
                "Beth should be reppoted.",
                "Water Anthony.",
                "Move Wendy"
            ]
        },
        {weekday: "Sun",
            day: 16,
            tasks: [
                "Task 1.",
                "Task 2."
            ]
        },
        {weekday: "Fri",
            day: 28,
            tasks: [
                "Different task.",
                "Water Friend of Anthony."
            ]
        },
    ]

    const [selectedTasks, setSelectedTasks] = useState(tasks)
    const [selected, setSelected] = useState(false);
    const taskDates = {
        '2023-04-12': {marked: true, dotColor: theme.colors.primary},
        '2023-04-16': {marked: true, dotColor: theme.colors.primary},
        '2023-04-28': {marked: true, dotColor: theme.colors.primary},
    }

    const onDaySelect = (day) => {
        let chosenDay = day.day
        let chosenTasks = [];
        let tempSelectedTasks = []
        for (let f = 0; f < tasks.length; f++) {
            let tempTask = tasks.at(f);
            if (tempTask.day === chosenDay){
                chosenTasks = tempTask.tasks;
            }
        }

        for (let i = 1; i <= chosenTasks.length ; i++){
            tempSelectedTasks.push(
                {weekday: i.toString(),
                day: "none",
                tasks: [chosenTasks.at(i-1)]}
            )
        }

        setSelectedTasks(tempSelectedTasks);
        setSelected(true);
    }

    const goBack = () => {
        setSelectedTasks(tasks);
        setSelected(false);
    }




    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <TasksHeader/>
            <TaskCalendar taskDates={taskDates} onDaySelect={onDaySelect}/>
            <Tasks tasks={selectedTasks} selected={selected}/>
            {selected &&
                <GoBackButton onPress={goBack}/>
            }
            <BottomMenu screenHeight={screenHeight} active={"calendar"} />
        </View>
    )
}