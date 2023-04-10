import { ScrollView } from "react-native";
import DivisionRow from "./DivisionRow";

export default function Divisions({ divisions, plants, handleUpdate }) {

    return (
        <ScrollView style={{ maxHeight: 485 }}>
            {divisions.map((division, index) => (
                <DivisionRow key={index} divisionName={division.name} plantCards={division.plants} userPlants={plants} divisionID={division.id} handleUpdate={handleUpdate}/>
            ))}
        </ScrollView>
    );

}