import axios from "axios";
const baseURL = "http://10.0.2.2:8080/growmate"

const getPlantInfo = async (userID, plantID) => {
    const response = await axios.get(baseURL + "/user/" + userID + "/inventory/" + plantID);
    return response.data;
}

const getSensorsForPlant = async (userID, plantID, division) => {
    let sensors = [];

    await axios.get(baseURL + "/user/" + userID + "/sensors/plant/" + plantID)
    .then((plantSensors) => plantSensors.data.map((sensor) => sensors.push(sensor)));

    if (division !== null){
        await axios.get(baseURL + "/user/" + userID + "/sensors/division/" + division["id"])
            .then((divisionSensors) => divisionSensors.data.map((sensor) => sensors.push(sensor)));

    }
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

const deletePlant = async (userID, plantID, dead) => {
    await axios.delete(baseURL + "/user/" + userID + "/inventory/" + plantID + "?dead=" + dead);
}

const getTaskSettings = async (userID, plantID, taskType) => {
    const response = await axios.get(baseURL + "/user/tasks/" + userID + "/settings?idPlant=" + plantID + "&taskType=" + taskType);
    return response.data
}

const updateTaskDate = async (userID, taskID, newDate) => {
    await axios.put(baseURL + "/user/tasks/" + userID + "/task/" + taskID + "?taskDate=" + newDate);
}

const toggleTaskMode = async (userID, plantID, taskType, taskFrequency) => {
    if (taskFrequency) {
        await axios.put(baseURL + "/user/tasks/" + userID + "/plant/" + plantID + "/toggleMode?taskType=" + taskType + "&frequency=" + taskFrequency);
    }
    else {
        await axios.put(baseURL + "/user/tasks/" + userID + "/plant/" + plantID + "/toggleMode?taskType=" + taskType);
    }

}

const updateTaskFrequency = async (userID, plantID, taskType, frequency) => {
    await axios.put(baseURL + "/user/tasks/" + userID + "/plant/" + plantID + "/frequency?taskType=" + taskType + "&frequency=" + frequency);
}

export {getPlantInfo, getAllDivisions, getSensorsForPlant, getPlantTasksTodo, updateTask, deletePlant, getTaskSettings,
    updateTaskDate, toggleTaskMode, updateTaskFrequency}