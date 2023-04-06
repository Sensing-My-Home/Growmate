import {View} from "react-native";
import {IconButton, Text, useTheme} from "react-native-paper";


export default function NextButton(){
    const theme = useTheme();
    return (
        <View style={{marginTop: 140, alignItems: "flex-end", marginRight: 60}}>
            <View style={{width: 120, height: 35, borderRadius: 20,
                backgroundColor: theme.colors.primary, flexDirection: "row",
                alignItems:"center", justifyContent: "center"
            }}>
                <Text variant={"bodyMedium"} style={{color: theme.colors.background, marginLeft: 25}}>
                    Next
                </Text>
                <IconButton icon={"arrow-right-thin"} size={20} iconColor={theme.colors.background} style={{marginLeft: 5}}/>
            </View>
        </View>
    )
}