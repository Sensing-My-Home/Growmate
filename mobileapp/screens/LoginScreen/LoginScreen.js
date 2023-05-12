import {Dimensions, View} from "react-native";
import {useTheme} from "react-native-paper";
import GreenBar from "../../components/GreenBar";
import React, {useState} from "react";
import LoginHeader from "./components/LoginHeader";
import LoginInfo from "./components/LoginInfo";
import LoginButton from "./components/LoginButton";
import SignUpButton from "./components/SignUpButton";

export default function LoginScreen(){
    const screenHeight = Dimensions.get('screen').height;
    const theme = useTheme()
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");

    const login = () => {
        console.log("logging in...");
        console.log(email);
        console.log(password);
    }
    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <LoginHeader/>
            <LoginInfo setPassword={setPassword} setEmail={setEmail}/>
            <LoginButton login={login}/>
            <SignUpButton/>
        </View>
    )
}