import { useState } from 'react';
import { View, ScrollView } from 'react-native';
import { Button, Dialog, Portal, Text, useTheme, Checkbox, Searchbar } from 'react-native-paper';

export default function AssociateSensorsDialog({ visibleChange, hideChange, userSensors, associateSensors }) {
    const theme = useTheme();

    const [checks, setChecks] = useState([]);

    const handleCheckboxChange = (plantId) => {
        setChecks((prevChecks) => {
            if (prevChecks.includes(plantId)) {
                return prevChecks.filter((id) => id !== plantId);
            } else {
                return [...prevChecks, plantId];
            }
        });
    };

    const [searchQuery, setSearchQuery] = useState('');

    const handleAssociateSensor = () => {
        const checkedSensors = userSensors.filter((plant) => checks.includes(plant.id));
        associateSensors(checkedSensors);
        hideChange();
    }

    return (
        <View>
            <Portal>
                <Dialog visible={visibleChange} onDismiss={hideChange} style={{ backgroundColor: theme.colors.background }}>
                    <Dialog.Title>Associate sensors to this division</Dialog.Title>
                    <Dialog.Content>
                        <Searchbar
                            placeholder="Search"
                            onChangeText={setSearchQuery}
                            value={searchQuery}
                            style={{ marginVertical: 15 }}
                        />
                        <Dialog.ScrollArea style={{maxHeight: 250}}>
                            <ScrollView contentContainerStyle={{ marginVertical: 15 }}>
                                {userSensors
                                    .filter((sensor) => searchQuery === '' || sensor.name.toLowerCase().includes(searchQuery.toLowerCase()))
                                    .map((sensor) => {
                                        const isChecked = checks.includes(sensor.id);
                                        return (
                                            <View style={{ flexDirection: "row", alignItems: "center", justifyContent: "space-between", marginVertical: 10 }} key={sensor.id}>
                                                <View style={{ flexDirection: "row", alignItems: "center" }}>
                                                    <Text variant='bodyLarge'>{sensor.name}</Text>
                                                </View>
                                                <Checkbox
                                                    status={isChecked ? 'checked' : 'unchecked'}
                                                    onPress={() => handleCheckboxChange(sensor.id)}
                                                />
                                            </View>
                                        )
                                    })}
                            </ScrollView>
                        </Dialog.ScrollArea>
                    </Dialog.Content>
                    <Dialog.Actions>
                        <Button onPress={hideChange} buttonColor={theme.colors.darkRed} textColor={theme.colors.background}>Cancel</Button>
                        <Button onPress={handleAssociateSensor} buttonColor={theme.colors.primary} textColor={theme.colors.background}>Associate</Button>
                    </Dialog.Actions>
                </Dialog>
            </Portal>
        </View>
    )
}