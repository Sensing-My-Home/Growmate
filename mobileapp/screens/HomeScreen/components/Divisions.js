import { ScrollView } from "react-native";
import DivisionRow from "./DivisionRow";

export default function Divisions({ divisions }) {

    return (
        <ScrollView style={{ maxHeight: 485 }}>
            {divisions.map((division, index) => (
                <DivisionRow key={index} divisionName={division.name} plantCards={division.plants} />
            ))}
        </ScrollView>
    );


}