import axios from "axios";
const baseURL = "http://10.0.2.2:8080/growmate"

const login = async (email, password) => {
    if (email === "" || password === ""){
        return false;
    }
    const response = await axios.post(baseURL + "/public/login?email=" + email+"&password=" +password).catch( () => {
        return false;
    })
    if (response.status === 200){
        return response.data;
    }
    else {
        return false;
    }
}

export {login}