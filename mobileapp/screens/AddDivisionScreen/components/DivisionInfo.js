import {ScrollView, View} from "react-native";
import {IconButton, Text, TextInput, useTheme} from "react-native-paper";
import React, {useState} from "react";
import DropDown from "react-native-paper-dropdown";
import AssociateSensorsDialog from "./AssociateSensorsDialog";
import {userType} from "../../../user";

export default function DivisionInfo({sensors, setName, setSensors, luminosity, luminosityTarget, setLuminosityTarget}){
    const theme = useTheme();
    const sensors_static = [
        {id: 1, name: "Sensor 1"},
        {id: 2, name: "Sensor 2"},
        {id: 3, name: "Sensor 3"},
        {id: 4, name: "Sensor 4"},
        {id: 5, name: "Sensor 5"},
        {id: 6, name: "Sensor 6"},
    ];
    const luminosity_static = [
        {name: "Sunny light", value: 0},
        {name: "High-light", value: 1},
        {name: "Medium-light", value: 2},
        {name: "Low-light", value: 3}
    ];
    const [associatedSensors, setAssociatedSensors] = useState([]);

    const [visibleAdd, setVisibleAdd] = useState(false);
    const setAdd = () => setVisibleAdd(true);
    const hideAdd = () => setVisibleAdd(false);

    const [showLuminosityDropDown, setShowLuminosityDropDown] = useState(false);

    return (
        <View style={{marginTop: 20, marginBottom: 30}}>
            <View style={{marginHorizontal: 50}}>
                <Text variant={"bodyMedium"} style={{ color: theme.colors.primary }}>Division name</Text>
            </View>
            <TextInput style={{ width: 300, backgroundColor: theme.colors.background, fontSize: 14, marginLeft: 50, marginBottom: 10}}
                       underlineColor={theme.colors.primaryContainer}
                       activeUnderlineColor={theme.colors.primary}
                       textColor={theme.colors.onBackground}
                       placeholder={"Insert division name"} placeholderTextColor={theme.colors.tertiary}
                       onChangeText={text => setName(text)}
            />

            <View style={{marginHorizontal: 50, marginTop: 10}}>
                <Text variant={"bodyMedium"} style={{ color: theme.colors.primary }}>Division luminosity</Text>
            </View>
            <View style={{marginHorizontal: 50}}>
                <DropDown
                    mode={"outlined"}
                    visible={showLuminosityDropDown}
                    showDropDown={() => setShowLuminosityDropDown(true)}
                    onDismiss={() => setShowLuminosityDropDown(false)}
                    value={luminosityTarget}
                    setValue={setLuminosityTarget}
                    list={luminosity_static.map((luminosity, index) => ({ label: luminosity.name, value: luminosity.value, key: index.toString() }))}
                    placeholder={"Select division luminosity"}
                    dropDownStyle={{maxHeight: 200 }}
                />
            </View>
            {userType === "PREMIUM" &&
                <View>
                    <View style={{marginHorizontal: 50, marginTop: 20, marginBottom: 5}}>
                        <Text variant={"bodyMedium"} style={{ color: theme.colors.primary }}>Associate sensors</Text>
                    </View>
                    {associatedSensors.length > 0 &&
                        <ScrollView style={{maxHeight: 100, marginHorizontal: 50}}>
                            {associatedSensors.map((sensor, index) => (
                                <View key={index} style={{
                                    width: 250, alignItems: "center",
                                    borderWidth: 1, borderRadius: 20,
                                    borderColor: theme.colors.opaqueGrey,
                                    marginTop: 5
                                }}>
                                    <Text variant={"bodyLarge"}>
                                        {sensor.name}
                                    </Text>
                                </View>
                            ))
                            }
                        </ScrollView>
                    }

                    {associatedSensors.length > 0 ?
                        <IconButton icon="playlist-edit" iconColor={theme.colors.secondary} size={25}
                                    onPress={setAdd} style={{alignSelf: "center", marginTop: 10, marginBottom: 20}}/>
                        :
                        <IconButton icon="plus-circle-outline" iconColor={theme.colors.secondary} size={25}
                                    onPress={setAdd} style={{alignSelf: "center", marginTop: 10, marginBottom: 100}}/>
                    }

                    <AssociateSensorsDialog
                        visibleChange={visibleAdd}
                        hideChange={hideAdd}
                        userSensors={sensors_static}
                        associateSensors={setAssociatedSensors}
                    />
                </View>
            }
        </View>
    )
}