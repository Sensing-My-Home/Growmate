import axios from "axios";
const baseURL = "http://10.0.2.2:8080/growmate"


export const createNewDivision = async (userId, name, luminosity) => {
    const response = axios.post(baseURL +
        "/user/" + userId +
        "/divisions?name=" + name +
        "&luminosity=" + luminosity);
}