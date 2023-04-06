import { useState, useEffect } from 'react'
import { View, Dimensions, ScrollView } from 'react-native';
import { SegmentedButtons } from 'react-native-paper';
import SensorGraph from './SensorGraph'
import 'react-native-reanimated';

export default function SensorGraphStack() {
    const { width: screenWidth } = Dimensions.get('window');
    const screenHeigth = Dimensions.get("window").height;

    const [value, setValue] = useState("temperature")

    const [sensorValuesList, setSensorValuesList] = useState([]);

    useEffect(() => {
        switch(value){
            case 'temperature':
                setSensorValuesList([
                    {
                        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                        datasets: [
                            {
                                data: [830, 762, 810, 700, 723, 493, 677, 641, 509, 213, 335, 198, 29]
                            },
                        ],
                        legend: ["Monday"]
                    },
                    {
                        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                        datasets: [
                            {
                                data: [830, 762, 810, 700, 723, 493, 677, 641, 509, 213, 335, 198, 29]
                            },
                        ],
                        legend: ["Tuesday"]
                    },
                    {
                        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                        datasets: [
                            {
                                data: [830, 762, 810, 700, 723, 493, 677, 641, 509, 213, 335, 198, 29]
                            },
                        ],
                        legend: ["Wednesday"]
                    },
                ]);
                break;
            case 'air_humidity':
                setSensorValuesList([
                    {
                        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                        datasets: [
                            {
                                data: [830, 762, 810, 700, 723, 493, 677, 641, 509, 213, 335, 198, 29]
                            },
                        ],
                        legend: ["Tuesday"]
                    }
                ]);
                break;
            case 'soil_humidity':
                setSensorValuesList([
                    {
                        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                        datasets: [
                            {
                                data: [830, 762, 810, 700, 723, 493, 677, 641, 509, 213, 335, 198, 29]
                            },
                        ],
                        legend: ["Wednesday"]
                    }
                ]);
                break;
        };
    }, [value]);

    return (
        <View style={{ paddingBottom: 200, paddingTop: 30 }}>
            <View style={{marginBottom: 15, paddingHorizontal: 15}}>
                <SegmentedButtons 
                    value={value}
                    onValueChange={setValue}
                    buttons={[
                        {
                            value: 'temperature',
                            label: 'Temperature'
                        },
                        {
                            value: 'air_humidity',
                            label: 'Air Humidity'
                        },
                        {
                            value: 'soil_humidity',
                            label: 'Soil Humidity'
                        },
                    ]}
                />
            </View>
            <ScrollView>
                {sensorValuesList.map((item, index) => {
                    return(
                        <SensorGraph key={index} data={item} /> 
                    )
                })}
            </ScrollView>
        </View>
        
    )
}