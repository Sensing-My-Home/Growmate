// GET user's plants
import axios from "axios";
const baseURL = "http://10.0.2.2:8080/growmate"

export const getPlants = async (id) => {
    const response = await axios.get(baseURL + "/user/" + id + "/plants");
    return response.data;
};


export const getDivisionsAndAssociatedPlants = async (id) => {
    let response = await axios.get(baseURL + "/user/" + id + "/divisions");
    const divisions = response.data;
    const data = [];
    for (let i = 1; i <= divisions.length; i++){
        data.push(
            {
            name: divisions[i-1].name,
            plants: (await axios.get(baseURL + "/user/" + id + "/division/" + i + "/plants")).data
            })
    }
    return data;
}
