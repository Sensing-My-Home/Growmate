import {Dimensions, View} from "react-native";
import GreenBar from "../../components/GreenBar";
import BottomMenu from "../../components/BottomMenu";
import React, {useState, useEffect} from "react";
import {useTheme} from "react-native-paper";
import TasksHeader from "./components/TasksHeader";
import Tasks from "./components/Tasks";
import TaskCalendar from "./components/TaskCalendar";
import GoBackButton from "./components/GoBackButton";
import {getTodoTasks} from "../../service/TasksScreenService";

export default function TasksScreen() {
    const [todoTasks, setTodoTasks] = useState([]);
    const [todoTaskDates, setTodoTaskDates] = useState({});
    const [todoSelectedTasks, setTodoSelectedTasks] = useState([]);
    const [selected, setSelected] = useState(false);
    const userId = 1;

    useEffect( () => {
        getTodoTasks(userId).then((tasks) => {
            const rawTasks = tasks;
            const taskDates = {};
            const todoTasks = [];
            for (let r = 0; r < rawTasks.length; r++){
                let date = new Date(rawTasks[r].taskDate);
                let dateString = date.toDateString().split(" ");
                let weekday = dateString[0];
                let day = dateString[2];
                let month = dateString[1];
                let year = date.getFullYear();
                let name = rawTasks[r].name;
                let id = rawTasks[r].id
                let description = rawTasks[r].description;
                todoTasks.push(
                    {
                        weekday: weekday,
                        day: day,
                        month: month,
                        year: year,
                        tasks: [
                            name
                        ],
                        id: id
                    }
                )
                taskDates[rawTasks[r].taskDate] = {marked: true, dotColor: theme.colors.primary};
            }
            setTodoTaskDates(taskDates);
            setTodoTasks(todoTasks);
            setTodoSelectedTasks(todoTasks);
        });
    }, []);

    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()




    const onDaySelect = (day) => {
        let chosenDay = day.day.toString();
        let chosenTasks = [];
        let tempSelectedTasks = []
        for (let f = 0; f < todoTasks.length; f++) {
            let tempTask = todoTasks.at(f);
            if (tempTask.day === chosenDay){
                chosenTasks.push(tempTask);
            }
        }

        for (let i = 1; i <= chosenTasks.length ; i++){
            tempSelectedTasks.push(
                {
                    weekday: i.toString(),
                    day: "none",
                    tasks: chosenTasks[i-1].tasks,
                    id: chosenTasks[i-1].id
                }
            )
        }

        setTodoSelectedTasks(tempSelectedTasks);
        setSelected(true);
    }

    const goBack = () => {
        setTodoSelectedTasks(todoTasks);
        setSelected(false);
    }


    
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <TasksHeader/>
            <TaskCalendar taskDates={todoTaskDates} onDaySelect={onDaySelect}/>
            <Tasks tasks={todoSelectedTasks} selected={selected} maxHeight={220}/>
            {selected &&
                <GoBackButton onPress={goBack}/>
            }
            <BottomMenu screenHeight={screenHeight} active={"calendar"} />
        </View>
    )
}