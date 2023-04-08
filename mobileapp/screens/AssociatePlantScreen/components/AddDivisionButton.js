import {TouchableOpacity, View} from "react-native";
import {Text, useTheme} from "react-native-paper";

export default function AddDivisionButton(){
    const theme = useTheme();
    return (
        <TouchableOpacity>
            <View style={{width: 130, height: 30 , backgroundColor: theme.colors.primary, borderRadius: 20,
                alignItems: "center", justifyContent: "center", marginTop: 30, marginLeft: 40, marginBottom: 100}}>
                <Text variant={"bodyMedium"} style={{color: theme.colors.background}}>
                    Add a division
                </Text>
            </View>
        </TouchableOpacity>

    )
}