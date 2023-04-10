import React, { useState } from 'react';
import { View, TouchableOpacity, Text } from 'react-native';
import {IconButton} from 'react-native-paper';

const Dropdown = ({ onSelect, theme }) => (
    <View style={{ backgroundColor: theme.colors.opaqueGrey,
        right: 0, top: 56, zIndex: 1, width: 130, height: 75,
        position: "absolute", alignItems: "center",
        justifyContent:"space-between", borderRadius: 10}}>
        <TouchableOpacity onPress={() => onSelect('Option 1')}>
            <Text style={{fontWeight: "500"}}>Change Profile</Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={() => onSelect('Option 2')}>
            <Text style={{fontWeight: "500"}}>Log out</Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={() => onSelect('Option 3')}>
            <Text style={{fontWeight: "500"}}>Delete Account</Text>
        </TouchableOpacity>
    </View>
);

export default function DropdownButton({ theme }){
    const [showDropdown, setShowDropdown] = useState(false);
    const [selectedOption, setSelectedOption] = useState(null);

    const handlePress = () => {
        setShowDropdown(!showDropdown);
    };

    const handleSelect = (option) => {
        setSelectedOption(option);
        setShowDropdown(false);
    };

    return (
        <View>
            <TouchableOpacity onPress={handlePress}>
                <View style={{ borderRadius: 50, backgroundColor: theme.colors.primaryContainer, borderWidth: 0, width: 50, height: 50, justifyContent: 'center', alignItems: 'center' }}>
                    <IconButton icon={"account"} iconColor={theme.colors.secondary} size={25} />
                </View>
            </TouchableOpacity>
            {showDropdown && (
                <Dropdown onSelect={handleSelect} theme={theme} />
            )}
        </View>
    );
};