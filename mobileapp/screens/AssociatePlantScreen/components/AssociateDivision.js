import {View} from "react-native";
import {Text, useTheme} from "react-native-paper";
import DropDown from "react-native-paper-dropdown";

export default function AssociateDivision({divisions, divisionsProps}){
    const theme = useTheme();
    const [showDivisionDropDown, setShowDivisionDropDown, divisionTarget, setDivisionTarget] = divisionsProps;
    return (
        <View style={{marginLeft: 50, marginTop: 60}}>
            <Text variant={"bodyLarge"} style={{color: theme.colors.primary, marginBottom: 30}}>
                Want to associate a division?
            </Text>

            <View style={{flexDirection: "row", alignItems: "center"}}>
                <Text variant={"bodyLarge"} style={{color: theme.colors.primary, fontWeight: "600", width: 100}}>
                    Division:
                </Text>
                <View style={{width: 200, backgroundColor: theme.colors.background, borderWidth: 0}}>
                    <DropDown
                        mode={"flat"}
                        visible={showDivisionDropDown}
                        showDropDown={() => setShowDivisionDropDown(true)}
                        onDismiss={() => setShowDivisionDropDown(false)}
                        value={divisionTarget}
                        setValue={setDivisionTarget}
                        list={divisions.map((name, index) => ({ label: name, value: name, key: index.toString() }))}
                        dropDownItemTextStyle={ { fontSize: 14 } }
                        dropDownItemSelectedTextStyle={ {fontSize: 14 }}
                        inputProps={{style: {fontSize: 14, backgroundColor: theme.colors.background,
                                color: theme.colors.secondary, height: 40, outlineWidth: 0, borderBottomWidth: 0} }}
                    />
                </View>
            </View>
        </View>
    )
}