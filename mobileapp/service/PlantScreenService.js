import axios from "axios";
const baseURL = "http://10.0.2.2:8080/growmate"

const getPlantInfo = async (userID, plantID) => {
    const response = await axios.get(baseURL + "/user/" + userID + "/inventory/" + plantID);
    return response.data;
}

const getSensorsForPlant = async (userID, plantID, divisionID) => {
    let sensors = [];

    await axios.get(baseURL + "/user/" + userID + "/sensors/plant/" + plantID)
    .then((plantSensors) => plantSensors.data.map((sensor) => sensors.push(sensor)));

    await axios.get(baseURL + "/user/" + userID + "/sensors/division/" + divisionID)
    .then((divisionSensors) => divisionSensors.data.map((sensor) => sensors.push(sensor)));

    return sensors;
}

const getAllDivisions = async (userID) => {
    const response = await axios.get(baseURL + "/user/" + userID + "/divisions");
    return response.data;
}

const getPlantTasksTodo = async (userID, plantID) => {
    const response = await axios.get(baseURL + "/user/tasks/" + userID + "/plant/" + plantID + "/todo");
    return response.data;
}

const updateTask = async (userID, plantID, taskID) => {
    const response = await axios.put(
        baseURL + "/user/tasks/" + userID + "/plant/" + plantID + "/updateTask/" + taskID,
        null,
    );
    return response.data;
}

const deletePlant = async (userID, plantID) => {
    await axios.delete(baseURL + "/user/" + userID + "/inventory/" + plantID);
}

const getTaskSettings = async (userID, plantID, taskType) => {
    const response = await axios.get(baseURL + "/user/tasks/" + userID + "/settings?idPlant=" + plantID + "&taskType=" + taskType);
    return response.data
}

export {getPlantInfo, getAllDivisions, getSensorsForPlant, getPlantTasksTodo, updateTask, deletePlant, getTaskSettings}