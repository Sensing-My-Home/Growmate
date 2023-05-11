import {Dimensions, View} from "react-native";
import GreenBar from "../../components/GreenBar";
import BottomMenu from "../../components/BottomMenu";
import React, {useEffect, useState} from "react";
import {useTheme} from "react-native-paper";
import TasksHeader from "./components/TasksHeader";
import Tasks from "./components/Tasks";
import TaskCalendar from "./components/TaskCalendar";
import GoBackButton from "./components/GoBackButton";
import {getTodoTasks} from "../../service/TasksScreenService";
import {getTaskSettings} from "../../service/PlantScreenService";
import TaskDialog from "../PlantScreen/components/TaskDialog";

export default function TasksScreen() {
    const [todoTasks, setTodoTasks] = useState([]);
    const [todoTaskDates, setTodoTaskDates] = useState({});
    const [todoSelectedTasks, setTodoSelectedTasks] = useState([]);
    const [selected, setSelected] = useState(false);
    const [selectedDay, setSelectedDay] = useState(0);
    const [counter, setCounter] = useState(0);
    const userId = 1;

    useEffect( () => {
        getTodoTasks(userId).then((tasks) => {
            const rawTasks = tasks;
            const taskDates = {};
            const todoTasks = [];

            for (let pID in rawTasks){
                for (let r = 0; r < rawTasks[pID].length; r++){
                    let date = new Date(rawTasks[pID][r].taskDate);
                    let dateString = date.toDateString().split(" ");
                    let weekday = dateString[0];
                    let day = dateString[2];
                    let month = dateString[1];
                    let year = date.getFullYear();
                    let name = rawTasks[pID][r].name;
                    let id = rawTasks[pID][r].id
                    todoTasks.push(
                        {
                            dateString: rawTasks[pID][r].taskDate,
                            weekday: weekday,
                            day: day,
                            month: month,
                            year: year,
                            tasks: [
                                name
                            ],
                            id: id,
                            taskType: rawTasks[pID][r].taskType,
                            plantID: pID
                        }
                    )
                    taskDates[rawTasks[pID][r].taskDate] = {marked: true, dotColor: theme.colors.primary};
                }
            }

            if (selected) {
                setTodoTaskDates(taskDates);
                setTodoTasks(todoTasks);
                onDaySelect(selectedDay, todoTasks);
            }
            else {
                setTodoTaskDates(taskDates);
                setTodoTasks(todoTasks);
                setTodoSelectedTasks(todoTasks);
            }
        });
    }, [counter]);

    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()

    const onDaySelect = (date, manualTodoTasks) => {
        if (manualTodoTasks){
            setSelectedDay(date);
            let chosenDay = date.day.toString();
            let chosenMonth = new Date(date.dateString).toDateString().split(" ")[1];
            let chosenYear = date.year.toString();
            let selectedTasks = [];
            for (let f = 0; f < manualTodoTasks.length; f++) {
                let task = manualTodoTasks.at(f);
                if (task.day.toString() === chosenDay && task.month === chosenMonth && task.year.toString() === chosenYear){
                    selectedTasks.push(task);
                }
            }
            setTodoSelectedTasks(selectedTasks);
            setSelected(true);
        }
        else {
            setSelectedDay(date);
            let chosenDay = date.day.toString();
            let chosenMonth = new Date(date.dateString).toDateString().split(" ")[1];
            let chosenYear = date.year.toString();
            let selectedTasks = [];
            for (let f = 0; f < todoTasks.length; f++) {
                let task = todoTasks.at(f);
                if (task.day.toString() === chosenDay && task.month === chosenMonth && task.year.toString() === chosenYear){
                    selectedTasks.push(task);
                }
            }
            setTodoSelectedTasks(selectedTasks);
            setSelected(true);
        }
    }

    const goBack = () => {
        setTodoSelectedTasks(todoTasks);
        setSelected(false);
    }

    const [visibleChange, setVisibleChange] = useState(false);
    const [taskName, setTaskName] = useState("");
    const [taskDueDate, setTaskDueDate] = useState("");
    const [taskMode, setTaskMode] = useState(true);
    const [taskFrequency, setTaskFrequency] = useState(0);
    const setChange = (taskName, taskDueDate, taskType, plantID) => {
        setTaskName(taskName);
        setTaskDueDate(taskDueDate);
        getTaskSettings(userId, plantID, taskType).then(
            (task) => {
                setTaskMode(task[plantID][0].automatic);
                setTaskFrequency(task[plantID][0].taskFrequency);
                setVisibleChange(true);
            }
        )

    }
    const hideChange = () => setVisibleChange(false);


    
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <TasksHeader/>
            <TaskCalendar taskDates={todoTaskDates} onDaySelect={onDaySelect}/>
            <Tasks tasks={todoSelectedTasks} selected={selected} maxHeight={220}
                   setCounter={setCounter} counter={counter} setChange={setChange}
                   userId={userId}
            />
            {selected &&
                <GoBackButton onPress={goBack}/>
            }
            <TaskDialog hideChange={hideChange} visibleChange={visibleChange} taskName={taskName}
                        taskDueDate={taskDueDate} taskMode={taskMode} taskFrequency={taskFrequency}
                        setTaskMode={setTaskMode} setTaskDueDate={setTaskDueDate} setTaskFrequency={setTaskFrequency}
            />
            <BottomMenu screenHeight={screenHeight} active={"calendar"} />
        </View>
    )
}