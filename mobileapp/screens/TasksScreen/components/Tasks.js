import {ScrollView, View} from "react-native";
import DayTasks from "./DayTasks";


export default  function Tasks({tasks, selected}){
    return (
        <View style={{ marginTop: 10, marginHorizontal: 30, justifyContent: "center", alignItems:"center"}}>
            {selected ?
                <ScrollView style={{ maxHeight: 220 }}  >
                    {tasks.map((task, index) => (
                        <DayTasks
                            key={index}
                            weekday={task.weekday}
                            day={task.day}
                            tasks = {task.tasks}
                        />
                    ))}
                </ScrollView>

                :

                <ScrollView style={{ maxHeight: 260 }}  >
                    {tasks.map((task, index) => (
                        <DayTasks
                            key={index}
                            weekday={task.weekday}
                            day={task.day}
                            tasks = {task.tasks}
                        />
                    ))}
                </ScrollView>
            }
        </View>
    )
}
