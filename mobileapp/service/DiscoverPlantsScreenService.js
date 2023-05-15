import axios from "axios";
const baseURL = "http://10.0.2.2:8080/growmate";
import { setItem, getItem } from "../cache";

export const getCategories = async () => {
    const cacheKey = "categories";

    const cacheData = await getItem(cacheKey);
    if (cacheData !== null) {
        console.log("cache");
        return cacheData;
    }

    const response = await axios.get(baseURL + "/public/catalogue/categories");
    await setItem(cacheKey, response.data);
    
    return response.data;
};