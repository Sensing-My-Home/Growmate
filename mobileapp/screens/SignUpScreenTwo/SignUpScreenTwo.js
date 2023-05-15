import {Dimensions, View} from "react-native";
import {useTheme} from "react-native-paper";
import GreenBar from "../../components/GreenBar";
import React, {useState} from "react";
import LoginSignUpHeader from "../../components/LoginSignUpHeader";
import SignUpMoreInfo from "./components/SignUpMoreInfo";
import SignUpButton from "./components/SignUpButton";
import {signUp} from "../../service/SignUpScreenService";
import {useNavigation} from "@react-navigation/native";


export default function SignUpScreenTwo({route}){
    const theme = useTheme()
    const screenHeight = Dimensions.get('screen').height;
    const {email, password} = route.params;
    const [photo, setPhoto] = useState(null);
    const [name, setName] = useState("");
    const [nameIsValid, setNameIsValid] = useState(true);
    const [dateOfBirth, setDateOfBirth] = useState("");
    const [dateOfBirthIsValid, setDateOfBirthIsValid] = useState(true);
    const [address, setAddress] = useState("");
    const [addressIsValid, setAddressIsValid] = useState(true);
    const [type, setType] = useState(false);
    const [experience, setExperience] = useState(0);
    const navigation = useNavigation();
    const onSignupPress = () => {
        let finalType;
        if (type === true) {
            finalType = "PREMIUM";
        }
        else {
            finalType = "NON-PREMIUM";
        }

        signUp(name, email, password, photo, dateOfBirth, experience, address, finalType).then(
            () => {navigation.navigate("Login")}
        );

    }

    return (
        <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
            <GreenBar />
            <LoginSignUpHeader title={"Just a few more steps..."} subtitle={"Tell us more about yourself!"}/>
            <SignUpMoreInfo photo={photo} setPhoto={setPhoto} setName={setName} nameIsValid={nameIsValid} setNameIsValid={setNameIsValid}
                            addressIsValid={addressIsValid} dateOfBirthIsValid={dateOfBirthIsValid} setAddress={setAddress}
                            setAddressIsValid={setAddressIsValid} setUserType={setType} userType={type} setDateOfBirthIsValid={setDateOfBirthIsValid}
                            setDate={setDateOfBirth} experience={experience} setExperience={setExperience}/>
            <SignUpButton signup={onSignupPress} disabled={!(nameIsValid && dateOfBirthIsValid && addressIsValid) || name==="" || dateOfBirth==="" || address ===""}/>
        </View>
    )
}