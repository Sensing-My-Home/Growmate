import {View} from "react-native";
import {Text, useTheme} from "react-native-paper";

export default function AddDivisionDescription(){
    const theme = useTheme();
    return (
        <View style={{marginTop: 30, marginLeft: 90}}>
            <Text variant={"bodyLarge"} style={{color: theme.colors.primary, width: 220}}>
                Associate a division to your home in order to better manage your plants!
            </Text>
        </View>
    )
}