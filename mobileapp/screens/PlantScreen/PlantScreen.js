import React, { useState, useEffect } from "react";
import { View, Dimensions, ScrollView } from "react-native";
import { Tabs, TabScreen } from 'react-native-paper-tabs';
import {Button, Dialog, Text, useTheme} from "react-native-paper";
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
import { getPlantInfo, getAllDivisions, getPlantTasksTodo, getSensorsForPlant, deletePlant } from "../../service/PlantScreenService";
import { deleteImage } from "../../service/FirebaseService";
import Tasks from "../TasksScreen/components/Tasks";
import GoBackButton from "../TasksScreen/components/GoBackButton";


export default function PlantScreen({ route }) {
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme();
    const navigation = useNavigation();
    // Info for the API call
    const { plantID } = route.params;
    const userID = 1;

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
            getSensorsForPlant(userID, plantID, plantInfo.division["id"])
            .then((info) => setSensors(info));
        };
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
    }, [counter]);

    const [selectedDay, setSelectedDay] = useState(0);

    const onDaySelect = (day) => {
        setSelectedDay(day);
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
                {weekday: i.toString(),
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

    // API call to delete plant;
    const handleDeletePlant = async () => {
        await deleteImage(userID, plantInfo.name);
        await deletePlant(userID, plantID);
        navigation.dispatch(StackActions.replace('Home'));
    }

    const [visibleChange, setVisibleChange] = useState(false);
    const setChange = () => setVisibleChange(true);
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
                        <Tasks tasks={todoSelectedTasks} selected={selected} userId={userID} plantID={plantID} setCounter={setCounter} counter={counter} maxHeight={200} setChange={setChange}/>
                        {selected &&
                            <GoBackButton onPress={goBack}/>
                        }
                        <Dialog visible={visibleChange} onDismiss={hideChange} style={{ backgroundColor: theme.colors.background }}>
                            <Dialog.Content>
                                <Text variant={"bodyMedium"}>Hello</Text>
                            </Dialog.Content>
                            <Dialog.Actions>
                                <Button onPress={hideChange} buttonColor={theme.colors.darkRed} textColor={theme.colors.background}>Close</Button>
                            </Dialog.Actions>
                        </Dialog>

                        </View>
                    </TabScreen>
                </Tabs>
                <BottomMenu screenHeight={screenHeight} />
            </View>
        )
    }
}