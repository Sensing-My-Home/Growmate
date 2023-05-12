import {TouchableOpacity} from "react-native";
import {Text, useTheme} from "react-native-paper";


export default function LogIn(){
    const theme = useTheme();
    return (
        <TouchableOpacity style={{backgroundColor: theme.colors.primaryContainer, borderRadius: 15, justifyContent: "center",
            alignItems: "center", marginTop: 35, width: 135, height: 35, alignSelf: "center"}}>
            <Text variant={"bodyLarge"} style={{color: theme.colors.background}}>
                LOG IN
            </Text>
        </TouchableOpacity>
    )
}