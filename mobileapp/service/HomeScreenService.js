import axios from "axios";
const baseURL = "http://10.0.2.2:8080/growmate"


const getFirstName = async (id) => {
    const response = await axios.get(baseURL + "/user/" + id);
    return response.data;
}

const getPlants = async (id) => {
    const response = await axios.get(baseURL + "/user/" + id + "/plants");
    return response.data;
};

const getDivisionsAndAssociatedPlants = async (id) => {
    let response = await axios.get(baseURL + "/user/" + id + "/divisions");
    const divisions = response.data;
    const data = [];
    for (let i = 1; i <= divisions.length; i++){
        data.push(
            {
            id: divisions[i-1].id,
            name: divisions[i-1].name,
            plants: (await axios.get(baseURL + "/user/" + id + "/division/" + i + "/plants")).data
            })
    }
    return data;
}

const addPlantToDivision = async (userID, plantID, divisionID) => {
    await axios.post(baseURL + "/user/" + userID + "/division/" + divisionID + "/plants/" + plantID)
}

const changePlantDivision = async (userID, plantID, divisionID, newDivisionID) => {
    await axios.put(
        baseURL + "/user/" + userID + "/division/" + divisionID + "/plants/" + plantID,
        null,
        { params: { newDivisionID: newDivisionID } }
    )
}

const removePlantFromDivision = async (userID, plantID, divisionID) => {
    await axios.put(
        baseURL + "/user/" + userID + "/division/" + divisionID + "/plants/" + plantID,
        null,
        { params: { newDivisionID: null } }
    )
}

export {getPlants, getDivisionsAndAssociatedPlants, addPlantToDivision, changePlantDivision, removePlantFromDivision, getFirstName}