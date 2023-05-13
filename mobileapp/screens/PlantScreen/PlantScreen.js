import React, { useState, useEffect } from "react";
import { View, Dimensions, ScrollView } from "react-native";
import { Tabs, TabScreen } from 'react-native-paper-tabs';
import {useTheme} from "react-native-paper";
import { useNavigation, StackActions } from '@react-navigation/native';

import BottomMenu from "../../components/BottomMenu";
import GreenBar from "../../components/GreenBar";
import PlantHeader from "./components/PlantHeader";
import PlantAvatar from "./components/PlantAvatar";
import DeletePlant from "./components/DeletePlant";
import CheckSpeciesButton from "./components/CheckSpeciesButton";
import PlantInformation from "./components/PlantInformation";
import SensorsCarousel from "./components/SensorsCarousel";
import PlantStatus from "./components/PlantStatus";
import SensorGraphStack from "./components/SensorGraphStack";
import TaskCalendar from "../TasksScreen/components/TaskCalendar";

//API functions
import {
    getPlantInfo,
    getAllDivisions,
    getPlantTasksTodo,
    getSensorsForPlant,
    deletePlant,
    getTaskSettings
} from "../../service/PlantScreenService";
import { deleteImage } from "../../service/FirebaseService";
import Tasks from "../TasksScreen/components/Tasks";
import GoBackButton from "../TasksScreen/components/GoBackButton";
import TaskDialog from "./components/TaskDialog";
import {userID} from "../../user";


export default function PlantScreen({ route }) {
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme();
    const navigation = useNavigation();
    // Info for the API call
    const { plantID} = route.params;

    // Get Plant info
    const [plantInfo, setPlantInfo] = useState(null);
    useEffect(() => {
        getPlantInfo(userID, plantID)
        .then((info) => setPlantInfo(info));
    }, [])

    // Get All sensors associated with a plant
    const [sensors, setSensors] = useState(null)
    useEffect(() => {
        if (plantInfo) {
            getSensorsForPlant(userID, plantID, plantInfo.division)
            .then((info) => setSensors(info));
        }
    }, [plantInfo])

    // Get All Divisions
    const [divisions, setDivisions] = useState(null);
    useEffect(() => {
        getAllDivisions(userID)
        .then((info) => setDivisions(info));
    }, [])

    //Get Plant tasks
    const [todoTasks, setTodoTasks] = useState([]);
    const [todoTaskDates, setTodoTaskDates] = useState({});
    const [todoSelectedTasks, setTodoSelectedTasks] = useState([]);
    const [selected, setSelected] = useState(false);
    const [counter, setCounter] = useState(0);
    useEffect( () => {
        getPlantTasksTodo(userID, plantID).then((tasks) => {
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
                todoTasks.push(
                    {
                        dateString: rawTasks[r].taskDate,
                        weekday: weekday,
                        day: day,
                        month: month,
                        year: year,
                        tasks: [
                            name
                        ],
                        id: id,
                        taskType: rawTasks[r].taskType
                    }
                )
                taskDates[rawTasks[r].taskDate] = {marked: true, dotColor: theme.colors.primary};
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

    const [selectedDay, setSelectedDay] = useState(0);

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

    // API call to delete plant;
    const handleDeletePlant = async () => {
        await deleteImage(userID, plantInfo.name);
        await deletePlant(userID, plantID, true);
        navigation.dispatch(StackActions.replace('Home'));
    }

    const [visibleChange, setVisibleChange] = useState(false);
    const [taskName, setTaskName] = useState("");
    const [taskDueDate, setTaskDueDate] = useState("");
    const [taskMode, setTaskMode] = useState(true);
    const [taskFrequency, setTaskFrequency] = useState(0);
    const [taskID, setTaskID] = useState(0);
    const [taskType, setTaskType] = useState(0);
    const [initialTaskDueDate, setInitialTaskDueDate] = useState("");
    const [initialTaskMode, setInitialTaskMode] = useState(true);
    const [initialTaskFrequency, setInitialTaskFrequency] = useState(0);

    const setChange = (taskName, taskDueDate, taskType, taskID) => {
        setTaskName(taskName);
        setTaskDueDate(taskDueDate);
        setInitialTaskDueDate(taskDueDate);
        setTaskID(taskID);
        setTaskType(taskType);
        getTaskSettings(userID, plantID, taskType).then(
            (task) => {
                setTaskMode(task[plantID][0].automatic);
                setInitialTaskMode(task[plantID][0].automatic);
                setTaskFrequency(task[plantID][0].taskFrequency);
                setInitialTaskFrequency(task[plantID][0].taskFrequency)
                setVisibleChange(true);
            }
        )

    }
    const hideChange = () => setVisibleChange(false);

    if (plantInfo && divisions && sensors && todoTasks) {
        return (
            <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
                <GreenBar />
                <PlantHeader name={plantInfo.name} />
                <Tabs
                    style={{ backgroundColor: theme.colors.background }}
                >
                    <TabScreen label="Info" icon="information">
                        <ScrollView>
                            <View style={{ paddingBottom: 100, paddingTop: 30 }}>
                                <CheckSpeciesButton plantId={plantID}/>
                                <PlantAvatar
                                    image={plantInfo.plantPhoto}
                                    species={plantInfo.species["commonName"]}
                                />
                                <DeletePlant
                                    name={plantInfo.name}
                                    deletePlant={handleDeletePlant}
                                />
                                <SensorsCarousel />
                                <PlantStatus name={plantInfo.name} status={plantInfo.plantCondition}/>
                                <PlantInformation
                                    plant={plantInfo}
                                    division={plantInfo.division}
                                    divisions={divisions}
                                />
                            </View>
                        </ScrollView>
                    </TabScreen>
                    <TabScreen label="Statistics " icon="chart-line">
                        <SensorGraphStack />
                    </TabScreen>
                    <TabScreen label="Tasks " icon="pencil">
                        <View>
                        <TaskCalendar taskDates={todoTaskDates} onDaySelect={onDaySelect}/>
                        <Tasks tasks={todoSelectedTasks} selected={selected} userId={userID} plantID={plantID} setCounter={setCounter} counter={counter} maxHeight={160} setChange={setChange}/>
                        {selected &&
                            <GoBackButton onPress={goBack}/>
                        }

                        </View>
                    </TabScreen>
                </Tabs>
                <TaskDialog hideChange={hideChange} visibleChange={visibleChange} taskName={taskName}
                            taskDueDate={taskDueDate} taskMode={taskMode} taskFrequency={taskFrequency}
                            setTaskMode={setTaskMode} setTaskDueDate={setTaskDueDate} setTaskFrequency={setTaskFrequency}
                            taskID={taskID} userID={userID} initialTaskDueDate={initialTaskDueDate} initialTaskFrequency={initialTaskFrequency}
                            initialTaskMode={initialTaskMode} setCounter={setCounter} counter={counter} plantID={plantID} taskType={taskType}/>
                <BottomMenu screenHeight={screenHeight} />
            </View>
        )
    }
}