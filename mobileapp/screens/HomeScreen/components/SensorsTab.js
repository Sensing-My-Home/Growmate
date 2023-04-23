import { useState, useEffect } from "react";
import { View, ScrollView } from "react-native";
import { List, Card, useTheme, Text } from "react-native-paper";

import SensorTypeRadioGroup from "./SensorTypeRadioGroup";
import SensorDropdown from "./SensorDropdown";
import SensorInfoCard from "./SensorInfoCard";

export default function SensorsTab({ userDivisions, sensors, userPlants }) {
    const theme = useTheme();

    // Format userDivisions data for the dropdown
    const [divisionsList, setDivisionsList] = useState([]);

    useEffect(() => {
        const formattedList = userDivisions.map((division) => ({
            label: division.name,
            value: division.id,
        }));
        setDivisionsList([{ label: 'All', value: "" }, ...formattedList]);
    }, []);

    // Format userPlants data for the dropdown
    const [plantsList, setPlantsList] = useState([]);
    useEffect(() => {
        const formattedList = userPlants.map((plant) => ({
            label: plant.name,
            value: plant.id,
        }));
        setPlantsList([{ label: 'All', value: "" }, ...formattedList]);
    }, []);

    // This is the selected division
    const [division, setDivision] = useState("");

    // This is the selected plant
    const [plant, setPlant] = useState("");

    // This is the type of sensor
    const [sensorType, setSensorType] = useState('');

    // Filter sensors
    const [filteredSensors, setFilteredSensors] = useState([]);

    // Count sensors shown
    const [countSensors, setCountSensors] = useState();

    useEffect(() => {
        let filteredSensorsList = [];
        switch (sensorType) {
          case 'division':
            filteredSensorsList = sensors.filter((sensor) => sensor["type"] === 'division');
            if (division !== "") {
                filteredSensorsList = filteredSensorsList.filter((sensor) => sensor["division_id"] === division);
            }
            break;
          case 'plant':
            filteredSensorsList = sensors.filter((sensor) => sensor["type"] === 'plant');
            if (plant !== "") {
                filteredSensorsList = filteredSensorsList.filter((sensor) => sensor["plant_id"] === plant);
            }
            break;
          default:
            filteredSensorsList = sensors;
        }
      
        setFilteredSensors(filteredSensorsList);
        setCountSensors(filteredSensorsList.length);
      }, [sensorType, division, plant]);

    return (
        <View style={{ margin: 10 }}>
            <Card contentStyle={{ backgroundColor: theme.colors.background }}>
                <List.Accordion
                    title="Filters"
                >
                    <List.Item
                        title=""
                        left={props => <SensorTypeRadioGroup sensorType={sensorType} setSensorType={setSensorType} />}
                    />
                    {sensorType && sensorType === 'division' && <List.Item
                        title=""
                        left={props => <SensorDropdown value={division} setValue={setDivision} list={divisionsList} label="Division"/>}
                    />}
                    {sensorType && sensorType === 'plant' && <List.Item
                        title=""
                        left={props => <SensorDropdown value={plant} setValue={setPlant} list={plantsList} label="Plant"/>}
                    />}
                </List.Accordion>
            </Card>
            <View style={{marginTop: 10}}>
                <Text variant="titleLarge">{countSensors} Sensor{countSensors !== 1 ? 's' : ''}</Text>
            </View>
            <ScrollView>
                {filteredSensors.map((sensor, index) => {
                    return(
                        <SensorInfoCard key={index} sensor={sensor}/>
                    )
                })}
            </ScrollView>
        </View>
    )
}