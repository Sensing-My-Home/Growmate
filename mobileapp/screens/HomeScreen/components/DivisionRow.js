import PlantCard from "./PlantCard";
import {ScrollView, View} from "react-native";
import {IconButton, Text, useTheme} from "react-native-paper";

export default function DivisionRow({ plantCards, divisionName }) {
    const theme = useTheme();
    // API call to add Plant to Division

    // API call to remove Plant from Division

    return (
        <View>
            <ScrollView horizontal style={{ marginTop: 10, marginHorizontal: 30}}>
                {plantCards.map((plantCard, index) => (
                    <PlantCard
                        key={index}
                        name={plantCard.name}
                        image={plantCard.image}
                        state={plantCard.state}
                    />
                ))}
            </ScrollView>
            <View style={{flexDirection: "row", alignItems:"center", marginHorizontal: 30}}>
                <IconButton icon="plus-circle-outline" iconColor={theme.colors.secondary} size={22} style={{marginRight: 0}}/>
                <IconButton icon="delete" iconColor={theme.colors.secondary} size={22} style={{marginLeft: 0}}/>
                <Text variant={"titleLarge"} style={{ color: theme.colors.primary, fontWeight: '700' }}>{divisionName}</Text>
                {plantCards.length > 1 ?
                    <Text variant={"bodyMedium"}
                          style={{ color: theme.colors.secondary, fontWeight: '500', marginLeft: 20 }}>
                        {plantCards.length} plants
                    </Text>
                    :
                    <Text variant={"bodyMedium"}
                          style={{ color: theme.colors.secondary, fontWeight: '500', marginLeft: 20 }}>
                        {plantCards.length} plant
                    </Text>
                }
            </View>
        </View>
    )
}