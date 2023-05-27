import axios from "axios";
const baseURL = "http://13.80.159.172/growmate/public/register?"

const signUp = async (name, email, password, profilePhoto, dateOfBirth, experience, address, userType) => {
    await axios.post(baseURL + "name=" + name +
                                        "&email=" +email + "&password=" + password +
                                        "&profilePhoto=" + profilePhoto + "&dateOfBirth=" + dateOfBirth +
                                        "&experience=" + experience + "&address=" + address + "&userType=" + userType);
}

export {signUp}

