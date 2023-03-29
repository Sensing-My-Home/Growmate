import { View } from "react-native";
import { Avatar, Text } from "react-native-paper";

export default function PlantAvatar({ image, species }) {
    return (
        <View style={{ alignItems: 'center', marginVertical: 25 }}>
            <Avatar.Image
                size={150}
                source={image}
            />
            <Text variant={"headlineSmall"} style={{ color: "#689f38", fontWeight: '700' }}>
                {species}
            </Text>
        </View>
    )
}