import axios from "axios";
const baseURL = "http://10.0.2.2:8080/growmate"


export const getSpeciesFromQuery = async (query) => {
    const response = await axios.get(baseURL + "/public/catalogue/species/?query=" + query);
    return response.data;
}