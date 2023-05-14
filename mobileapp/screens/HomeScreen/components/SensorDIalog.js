import React, { useState, useEffect } from "react";
import { Dialog, Portal, Button, TextInput, Text, useTheme } from "react-native-paper";
import { View, StyleSheet } from "react-native";

import SensorDropdown from "./SensorDropdown";

export default function SensorDialog({ sensor, lastMeasurement, visible, onDismiss, onSave, onDelete, dropDownList }) {
    const [editedName, setEditedName] = useState();
    const [dropDownValue, setDropDownValue] = useState();
    const dropDownLabel = sensor.type === "plant" ? "Plant" : "Division";
    const theme = useTheme();

    const dropDownListFormated = dropDownList.map(item => ({ label: item.name, value: String(item.id) }));

    const handleNameChange = (name) => {
        setEditedName(name);
    };

    useEffect(() => {
        setEditedName(sensor.name);
        setDropDownValue(sensor.type === "plant" ? sensor.plant_id : sensor.division_id);
    }, [sensor]);

    const handleSave = () => {
        onSave(editedName, sensor.original_id, dropDownValue);
        onDismiss();
    };

    const handleDelete = () => {
        onDelete(sensor.original_id);
        onDismiss();
    };

    return (
        <Portal>
            <Dialog visible={visible} onDismiss={onDismiss} style={{backgroundColor: theme.colors.background}}>
                <Dialog.Title>Sensor Details</Dialog.Title>
                <Dialog.Content>
                    <View style={styles.row}>
                        <Text variant="bodyLarge">Sensor Name:</Text>
                        <TextInput value={editedName} onChangeText={handleNameChange} style={styles.input} />
                    </View>
                    <View style={styles.row}>
                        <Text variant="bodyLarge">Sensor Type:</Text>
                        <Text style={styles.text} variant="bodyMedium">{sensor.type}</Text>
                    </View>
                    <View style={styles.row}>
                        <Text variant="bodyLarge">Sensor Code:</Text>
                        <Text style={styles.text} variant="bodyMedium">{sensor.sensorCode}</Text>
                    </View>
                    <View style={styles.row}>
                        <Text variant="bodyLarge">Last Measurement:</Text>
                        <Text style={styles.text} variant="bodyMedium">{lastMeasurement}</Text>
                    </View>
                    <SensorDropdown value={dropDownValue} setValue={setDropDownValue} list={dropDownListFormated} label={dropDownLabel} />
                </Dialog.Content>
                <Dialog.Actions>
                    <Button onPress={handleSave} buttonColor={theme.colors.primary} textColor={theme.colors.background}>Save</Button>
                    <Button onPress={handleDelete} buttonColor={theme.colors.error} textColor={theme.colors.background}>Delete</Button>
                    <Button onPress={onDismiss} buttonColor={theme.colors.secondary} textColor={theme.colors.background}>Close</Button>
                </Dialog.Actions>
            </Dialog>
        </Portal>
    );
}

const styles = StyleSheet.create({
    row: {
        flexDirection: 'column',
        alignItems: 'flex-start',
        justifyContent: 'space-between',
        marginVertical: 5
    },
    text: {
        marginBottom: 5
    },
    input: {
        width: '100%',
        backgroundColor: 'white'
    },
});



