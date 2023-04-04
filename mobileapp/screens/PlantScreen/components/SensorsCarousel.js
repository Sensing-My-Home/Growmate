import React, { useState, useEffect } from 'react';
import Carousel from 'react-native-snap-carousel';
import PlantSensorCard from './PlantSensorCard';
import { View, Dimensions } from 'react-native';

const { width: screenWidth } = Dimensions.get('window');

export default function SensorsCarousel({ sensors }) {

    const [entries, setEntries] = useState([]);

    useEffect(() => {
        setEntries(sensors);
    }, []);

    const renderItem = ({ item, index }) => {
        return (
            <View style={{ paddingBottom: 30 }}>
                <PlantSensorCard
                    key={index}
                    type={item.type}
                    value={item.value}
                />
            </View>
        );
    };

    return (
        <View>
            <Carousel
                sliderWidth={screenWidth}
                itemWidth={screenWidth / 2}
                data={entries}
                renderItem={renderItem}
                inactiveSlideOpacity={1}
                inactiveSlideScale={0.7}
            />
        </View>
    );
}