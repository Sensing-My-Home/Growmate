import axios from "axios";
const baseURL = "http://10.0.2.2:8080/growmate"

export const getCategories = async () => {
    const response = await axios.get(baseURL + "/public/catalogue/categories");
    return response.data;
};