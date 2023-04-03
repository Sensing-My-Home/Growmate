import PlantCard from "./PlantCard";
import { View } from "react-native";

export default function PlantCardRow({ plantCards }) {

    return (
        <View style={{ marginTop: 10, marginHorizontal: 20, flexDirection: 'row' }}>
            {plantCards.map((plantCard, index) => (
                <PlantCard
                    key={index}
                    name={plantCard.name}
                    image={plantCard.image}
                />
            ))}
        </View>
    )
}