import React, { useState, useEffect } from "react";
import { View, ScrollView, Dimensions } from "react-native";
import { List, Card, useTheme, Text, Portal, Dialog } from "react-native-paper";

import SensorTypeRadioGroup from "./SensorTypeRadioGroup";
import SensorDropdown from "./SensorDropdown";
import SensorInfoCard from "./SensorInfoCard";
import SensorDialog from "./SensorDIalog";

export default function SensorsTab({ userDivisions, sensors, userPlants }) {
  const theme = useTheme();
  const screenHeight = Dimensions.get('screen').height;
  const screenWidth = Dimensions.get("screen").width;

  const [divisionsList, setDivisionsList] = useState([]);
  const [plantsList, setPlantsList] = useState([]);
  const [division, setDivision] = useState("");
  const [plant, setPlant] = useState("");
  const [sensorType, setSensorType] = useState("");
  const [filteredSensors, setFilteredSensors] = useState([]);
  const [sensorModalVisible, setSensorModalVisible] = useState(false);
  const [selectedSensor, setSelectedSensor] = useState(null);

  useEffect(() => {
    const formatDivisionsList = (data) =>
      [{ label: 'All', value: "" }, ...data.map(item => ({ label: item.name, value: item.id }))];

    const formatPlantsList = (data) =>
      [{ label: 'All', value: "" }, ...data.map(item => ({ label: item.name, value: item.id }))];

    setDivisionsList(formatDivisionsList(userDivisions));
    setPlantsList(formatPlantsList(userPlants));
  }, [userDivisions, userPlants]);

  useEffect(() => {
    const filteredSensorsList = sensors.filter((sensor) => {
      if (sensorType === 'division') {
        if (division === "") {
          return sensor.type === 'division'; // Include all division sensors
        } else {
          return sensor.type === 'division' && sensor.division_id === String(division); // Matched division sensor
        }
      } else if (sensorType === 'plant') {
        if (plant === "") {
          return sensor.type === 'plant'; // Include all plant sensors
        } else {
          return sensor.type === 'plant' && sensor.plant_id === String(plant); // Matched plant sensor
        }
      }
      return true; // No filter applied for other sensor types
    });

    setFilteredSensors(filteredSensorsList);
  }, [sensorType, division, plant, sensors]);

  const countSensors = filteredSensors.length;

  const editSensor = (name, sensorID, dropDownValue) => {
    console.log(name);
    console.log(sensorID);
    console.log(dropDownValue);
  }

  const deleteSensor = (sensorID) => {
    console.log(sensorID);
  }

  return (
    <>
      <View style={{ margin: 10 }}>
        <Card contentStyle={{ backgroundColor: theme.colors.background }}>
          <List.Accordion title="Filters">
            <List.Item
              title=""
              left={(props) => (
                <SensorTypeRadioGroup sensorType={sensorType} setSensorType={setSensorType} />
              )}
            />
            {sensorType === 'division' && (
              <List.Item
                title=""
                left={(props) => (
                  <View style={{ marginLeft: 16, width: screenWidth - 100 }}>
                    <SensorDropdown value={division} setValue={setDivision} list={divisionsList} label="Division" />
                  </View>
                )}
              />
            )}
            {sensorType === 'plant' && (
              <List.Item
                title=""
                left={(props) => (
                  <View style={{ marginLeft: 16, width: screenWidth - 100 }}>
                    <SensorDropdown value={plant} setValue={setPlant} list={plantsList} label="Plant" />
                  </View>
                )}
              />
            )}
          </List.Accordion>
        </Card>
        <View style={{ marginTop: 10 }}>
          <Text variant="titleLarge">{countSensors} Sensor{countSensors !== 1 ? 's' : ''}</Text>
        </View>
        <ScrollView style={{ height: screenHeight / 2 }}>
          {filteredSensors.map((sensor) => (
            <SensorInfoCard
              key={sensor.id}
              sensor={sensor}
              onPress={() => {
                setSelectedSensor(sensor);
                setSensorModalVisible(true);
              }} />
          ))}
        </ScrollView>
      </View>

      {selectedSensor && <SensorDialog
        sensor={selectedSensor}
        lastMeasurement={100}
        visible={sensorModalVisible}
        onDismiss={() => setSensorModalVisible(false)} // Update this line
        onSave={(name, sensorID, dropDownValue) => editSensor(name, sensorID, dropDownValue)}
        onDelete={(sensorID) => deleteSensor(sensorID)}
        dropDownList={selectedSensor.type === 'division' ? userDivisions : userPlants}
      />}
    </>
  );
}
