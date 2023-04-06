import {TouchableOpacity, View} from "react-native";
import {IconButton, Text, useTheme} from "react-native-paper";
import {useNavigation} from "@react-navigation/native";


export default function NextButton({text, reverse, page}){
    const theme = useTheme();
    const navigation = useNavigation();
    return (
        <View style={{marginTop: 140, alignItems: "flex-end", marginRight: 60}}>
            <TouchableOpacity onPress={() => {
                navigation.navigate(page)}
            }>

                {reverse ?
                    <View style={{width: 120, height: 35, borderRadius: 20,
                        backgroundColor: theme.colors.background, flexDirection: "row",
                        alignItems:"center", justifyContent: "center", borderWidth: 1, borderColor: theme.colors.primary
                    }}>
                        <Text variant={"bodyMedium"} style={{color: theme.colors.primary, marginLeft: 25}}>
                            {text}
                        </Text>
                        <IconButton icon={"arrow-right-thin"} size={20} iconColor={theme.colors.primary} style={{marginLeft: 5}}/>
                    </View>
                    :
                    <View style={{width: 120, height: 35, borderRadius: 20,
                        backgroundColor: theme.colors.primary, flexDirection: "row",
                        alignItems:"center", justifyContent: "center"
                    }}>
                        <Text variant={"bodyMedium"} style={{color: theme.colors.background, marginLeft: 25}}>
                            {text}
                        </Text>
                        <IconButton icon={"arrow-right-thin"} size={20} iconColor={theme.colors.background} style={{marginLeft: 5}}/>
                    </View>
                }

            </TouchableOpacity>
        </View>
    )
}