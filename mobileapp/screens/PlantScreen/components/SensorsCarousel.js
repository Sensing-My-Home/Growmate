import React, { useState, useEffect } from 'react';
import Carousel from "react-native-reanimated-carousel";
import PlantSensorCard from './PlantSensorCard';
import { View, Dimensions } from 'react-native';

const { width: screenWidth } = Dimensions.get('window');
const { height: screenHeight } = Dimensions.get('window');

export default function SensorsCarousel() {

    const sensors = [
        {
            id: 0,
            type: 'soil',
            value: '56'
        },
        {
            id: 1,
            type: 'temperature',
            value: '18'
        },
        {
            id: 2,
            type: 'air',
            value: '78'
        },
    ];

    const [entries, setEntries] = useState([]);

    useEffect(() => {
        setEntries(sensors);
    }, []);

    const renderItem = ({ item, index }) => {
        return (
            <PlantSensorCard
                key={index}
                type={item.type}
                value={item.value}
            />
        );
    };

    return (
        <View style={{ height: screenHeight / 6 }}>
            <Carousel
                width={screenWidth}
                data={entries}
                renderItem={renderItem}
                mode="parallax"
                modeConfig={{
                    parallaxScrollingScale: 0.9,
                    parallaxScrollingOffset: 200,
                }}
            />
        </View>
    );
}