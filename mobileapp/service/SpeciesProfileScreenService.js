import axios from "axios";
const baseURL = "http://10.0.2.2:8080/growmate"

export const getPlantSpeciesInfo = async (userId, plantId) => {
    const response = await axios.get(baseURL + "/user/" + userId + "/inventory/" + plantId + "/speciesinfo");
    return response.data;
}