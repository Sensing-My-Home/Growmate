import {ScrollView, View} from "react-native";
import DayTasks from "./DayTasks";


export default  function Tasks({tasks}){
    return (
        <View style={{ marginTop: 10, marginHorizontal: 30, justifyContent: "center", alignItems:"center"}}>
            <ScrollView style={{ maxHeight: 300 }}  >
                {tasks.map((task, index) => (
                    <DayTasks
                        key={index}
                        weekday={task.weekday}
                        day={task.day}
                        tasks = {task.tasks}
                    />
                ))}
            </ScrollView>
        </View>
    )
}
