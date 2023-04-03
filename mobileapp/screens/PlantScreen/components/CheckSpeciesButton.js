import { View } from "react-native";
import { Button, useTheme } from "react-native-paper";
import { useNavigation } from '@react-navigation/native';

export default function CheckSpeciesButton() {
    const theme = useTheme();
    const navigation = useNavigation();

    return (
        <View style={{ alignItems: 'center', marginVertical: 25 }}>
            <Button
                textColor={theme.colors.background}
                buttonColor={theme.colors.primary}
            >
                Check Species Info
            </Button>
        </View>
    )
}