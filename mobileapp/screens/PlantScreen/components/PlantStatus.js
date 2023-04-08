import { useState } from "react";
import { View } from "react-native";
import { useTheme, Text, Avatar } from "react-native-paper";

export default function PlantStatus({ name }) {
    const theme = useTheme();

    const [status, setStatus] = useState('happy')

    const getEmote = (status) => {
        switch (status) {
            case "happy":
                return "emoticon-happy"
            case "neutral":
                return "emoticon-neutral"
            case "sad":
                return "emoticon-sad"
        }
    }

    const getColor = (status) => {
        switch (status) {
            case "happy":
                return theme.colors.primary
            case "neutral":
                return theme.colors.secondary
            case "sad":
                return theme.colors.error
        }
    }

    const getText = (status) => {
        switch (status) {
            case "happy":
                return "No need to add anything"
            case "neutral":
                return "You should check your tasks"
            case "sad":
                return "Stop neglecting me"
        }
    }

    return (
        <View style={{ paddingBottom: 30, flexDirection: "row", alignItems: "center", justifyContent: "space-between", paddingHorizontal: 30 }}>
            <View style={{ flex: 1 }}>
                <Avatar.Icon size={90} icon={getEmote(status)} style={{ backgroundColor: getColor(status) }} />
            </View>
            <View style={{ flex: 2 }}>
                <Text variant="headlineSmall" >{name} is feeling {status}</Text>
                <Text variant="bodyLarge" >{getText(status)}</Text>
            </View>
        </View>
    )
}