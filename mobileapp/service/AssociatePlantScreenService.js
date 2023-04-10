import axios from "axios";
const baseURL = "http://10.0.2.2:8080/growmate"


export const createNewPlant = async (userId, name, photoURL, speciesId, divisionId, plantationDate) => {
    const response = axios.post(baseURL +
        "/user/" + userId +
        "/addplant?plantName=" + name +
        "&photoURL=" + photoURL +
        "&species-id=" + speciesId +
        "&division-id=" + divisionId +
        "&plantation-date=" + plantationDate).then(function (response) { console.log(response)});
}
