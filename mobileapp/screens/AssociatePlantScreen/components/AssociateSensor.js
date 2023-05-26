import {View} from "react-native";
import {Text, useTheme} from "react-native-paper";
import DropDown from "react-native-paper-dropdown";

export default function AssociateSensor({sensors, humidityProps}){
    const theme = useTheme();
    const [showHumidityDropDown, setShowHumidityDropDown, humiditySensorTarget, setHumiditySensorTarget] = humidityProps;
    return (
        <View style={{marginLeft: 50, marginTop: 30}}>
            <Text variant={"bodyLarge"} style={{color: theme.colors.primary, marginBottom: 30}}>
                Want to associate a sensor?
            </Text>

            {Object.keys(sensors).length > 0 ?
                <View style={{flexDirection: "row", alignItems: "center"}}>
                    <Text variant={"bodyLarge"} style={{color: theme.colors.primary, fontWeight: "600", width: 100}}>
                        Sensor:
                    </Text>
                    <View style={{width: 200, backgroundColor: theme.colors.background, borderWidth: 0}}>
                        <DropDown
                            mode={"flat"}
                            visible={showHumidityDropDown}
                            showDropDown={() => setShowHumidityDropDown(true)}
                            onDismiss={() => setShowHumidityDropDown(false)}
                            value={humiditySensorTarget}
                            setValue={setHumiditySensorTarget}
                            list={Object.values(sensors).map((sensor, index) => ({ label: sensor[0].sensorCode, value: sensor[0].id, key: index.toString() }))}
                            dropDownItemTextStyle={ { fontSize: 14 } }
                            dropDownItemSelectedTextStyle={ {fontSize: 14 }}
                            inputProps={{style: {fontSize: 14, backgroundColor: theme.colors.background,
                                    color: theme.colors.secondary, height: 40, outlineWidth: 0, borderBottomWidth: 0} }}
                        />
                    </View>
                </View>
                :
                <Text variant={"bodyMedium"} style={{color: theme.colors.outline, fontWeight: "600", width: 300, alignSelf: "center"}}>
                    You don't have any sensors yet
                </Text>
            }

        </View>
    )
}