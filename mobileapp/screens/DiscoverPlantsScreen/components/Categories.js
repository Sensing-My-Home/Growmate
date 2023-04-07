import {View} from "react-native";
import CategoryCard from "./CategoryCard";


export default function Categories(){
    const flowering = require("../../../assets/orchids.jpeg");
    const cacti = require("../../../assets/cacti.jpeg");
    const herbs = require("../../../assets/herbs.jpeg");
    const ferns = require("../../../assets/ferns.webp");
    const moss = require("../../../assets/moss.webp");
    const conifer = require("../../../assets/conifer.jpeg");
    return (
        <View>
            <View style={{flexDirection: "row", marginTop: 30, justifyContent: "center", alignItems: "center"}}>
                <CategoryCard name={"Flowering"} image={flowering}/>
                <CategoryCard name={"Cacti and Suculents"} image={cacti}/>
                <CategoryCard name={"Herbs"} image={herbs}/>
            </View>
            <View style={{flexDirection: "row", marginTop: 30, justifyContent: "center"}}>
                <CategoryCard name={"Ferns"} image={ferns}/>
                <CategoryCard name={"Moss"} image={moss}/>
                <CategoryCard name={"Conifer"} image={conifer}/>
            </View>
        </View>
    )
}