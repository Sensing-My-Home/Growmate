import {View} from "react-native";
import {Card, Text, useTheme} from "react-native-paper";
import React from "react";

export default function DayTasks({weekday, day, tasks}){
    const theme = useTheme();
    return (
        <View style={{marginBottom: 20}}>
            <View style={{flexDirection: "row"}}>
                <View style={{flexDirection: "column", alignItems: "center", justifyContent: "center", marginRight: 20, width: 60}}>
                    <Text variant={"headlineSmall"} style={{ color: theme.colors.primary, fontWeight: '700'}}>
                        {weekday}
                    </Text>
                    {day === "none" ? null :
                        <Text variant={"bodyMedium"}
                              style={{ color: theme.colors.secondary, fontWeight: '500'}}>
                            {day}
                        </Text>
                    }
                </View>
                <Card style={{backgroundColor: theme.colors.background, width: 230}}>
                    <Card.Content>
                        {tasks.map((task, index) => (
                            <Text key={index} variant={"bodyMedium"}>
                                {task}
                            </Text>
                        ))}
                    </Card.Content>
                </Card>
            </View>
        </View>
    )
}