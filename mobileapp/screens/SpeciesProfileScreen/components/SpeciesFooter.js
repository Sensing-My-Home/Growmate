import {TouchableOpacity, View} from "react-native";
import {IconButton, Text, useTheme} from "react-native-paper";

export default function SpeciesFooter(){
    const theme = useTheme();
    return(
        <View style={{flexDirection: "row", marginHorizontal: 30, marginTop: 20, alignItems: "center"}}>
            <View style={{width: 190, marginLeft: 15}}>
                <Text variant={"bodyMedium"} style={{color: theme.colors.primary, fontWeight: "600"}}>
                    Do you have any doubts?
                    Consult our forum!
                </Text>
            </View>
            <TouchableOpacity>
                <View style={{flexDirection: "row", width: 120, borderWidth: 1, borderRadius: 20,
                    borderColor: theme.colors.primary, height: 30, alignItems: "center", justifyContent: "center"}}>
                    <Text variant={"bodyMedium"} style={{color: theme.colors.primary, marginLeft: 15}}>FORUM</Text>
                    <IconButton icon={"arrow-right-thin"} size={20} iconColor={theme.colors.primary} style={{marginLeft: 5}}/>
                </View>
            </TouchableOpacity>
        </View>
    )
}