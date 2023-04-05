import React from 'react';
import {Dimensions, View} from 'react-native';
import {IconButton, useTheme} from 'react-native-paper';

export default function PlusButton({ onPress }) {
    const screenHeight = Dimensions.get('screen').height;
    const screenWidth = Dimensions.get('screen').width;
    const theme = useTheme();

    return (
        <View
            style={{
                position: 'absolute',
                bottom: screenHeight/13 * 2,
                right: screenWidth/12,
                borderRadius: 50,
                backgroundColor: theme.colors.primary,
                width: 50,
                height: 50,
                justifyContent: 'center',
                alignItems: 'center',
                elevation: 5, // to add shadow
            }}
        >
            <IconButton icon="plus" iconColor={theme.colors.background} size={24} onPress={onPress}/>
        </View>
    );
};
