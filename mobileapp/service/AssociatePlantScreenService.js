import axios from "axios";
const baseURL = "http://10.0.2.2:8080/growmate"


export const createNewPlant = async (userId, name, photoURL, speciesId, divisionId, plantationDate) => {
    const response = axios.post(baseURL +
        "/user/" + userId +
        "/addplant?plantName=" + name +
        "&photoURL=" + "https://www.wellandgood.com/wp-content/uploads/2020/03/Stocksy_txp4cc410a83SK300_Small_952709.jpg" +
        "&species-id=" + speciesId +
        "&division-id=" + divisionId +
        "&plantation-date=" + plantationDate);
}
