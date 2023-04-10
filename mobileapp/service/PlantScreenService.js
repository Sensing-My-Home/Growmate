import axios from "axios";
const baseURL = "http://10.0.2.2:8080/growmate"

const getPlantInfo = async (userID, plantID) => {
    const response = await axios.get(baseURL + "/user/" + userID + "/inventory/" + plantID);
    return response.data;
}

const getPlantSensors = async (userID, plantID) => {
    const response = await axios.get(baseURL + "/user/" + userID + "/sensors/plant/" + plantID);
    return response.data;
}

const getAllDivisions = async (userID) => {
    const response = await axios.get(baseURL + "/user/" + userID + "/divisions");
    return response.data;
}

export {getPlantInfo, getAllDivisions, getPlantSensors}