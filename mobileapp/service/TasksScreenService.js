import axios from "axios";
const baseURL = "http://10.0.2.2:8080/growmate"

export const getTodoTasks = async (userId) => {
    const response = await axios.get(baseURL + "/user/tasks/" + userId + "/todo");
    return response.data;
}
