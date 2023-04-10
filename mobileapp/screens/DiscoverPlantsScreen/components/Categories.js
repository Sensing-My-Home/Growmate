import {View, ScrollView} from "react-native";
import CategoryCard from "./CategoryCard";

export default function Categories({categories}){
    const cardsPerRow = 3;
    const numRows = Math.ceil(categories.length / cardsPerRow);
    const rows = [];
    for (let i = 0; i < numRows; i++) {
        const start = i * cardsPerRow;
        const end = start + cardsPerRow;
        rows.push(categories.slice(start, end));
    }
    const cacti = require("../../../assets/cacti.jpeg");

    return (
        <View>
            <ScrollView style={{maxHeight: 500}}>
            {rows.map((row, index) => (
                <View style={{flexDirection: "row", marginTop: 30, justifyContent: "center", alignItems: "center"}} key={index}>
                {row.map((category, index) => (
                    <CategoryCard name={category.name} image={cacti} id={category.id} key={index}/>
                    ))}
                </View>
            ))}
            </ScrollView>
        </View>
    )
}