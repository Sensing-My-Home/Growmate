import {ScrollView, View} from "react-native";
import DayTasks from "./DayTasks";


export default  function Tasks({tasks, selected, userId, plantID, setCounter, counter, maxHeight, setChange}){
    return (
        <View style={{ marginTop: 10, marginHorizontal: 30, justifyContent: "center", alignItems:"center"}}>
            {selected ?
                <ScrollView style={{ maxHeight: maxHeight-40 }}  >
                    {tasks.map((task, index) => (
                        <DayTasks
                            key={`selected-${index}`}
                            weekday={task.weekday}
                            day={task.day}
                            tasks = {task.tasks}
                            userId={userId}
                            plantId={plantID}
                            taskId={task.id}
                            setCounter={setCounter}
                            counter={counter}
                            setChange={setChange}
                        />
                    ))}
                </ScrollView>

                :

                <ScrollView style={{ maxHeight: maxHeight }}  >
                    {tasks.map((task, index) => (
                        <DayTasks
                            key={`not-selected-${index}`}
                            weekday={task.weekday}
                            day={task.day}
                            tasks = {task.tasks}
                            userId={userId}
                            plantId={plantID}
                            taskId={task.id}
                            setCounter={setCounter}
                            counter={counter}
                            setChange={setChange}
                        />
                    ))}
                </ScrollView>
            }
        </View>
    )
}
