import {View, StyleSheet} from "react-native";
import {IconButton, Text, useTheme} from "react-native-paper";


export default function SpeciesInfo({info}){
    const theme = useTheme();
    const stars = [];
    for (let i = 0; i < 5; i++){
        if (i < info.difficulty){
            stars.push(
                <IconButton key={i} icon={"star"} size={12} style={{ marginLeft: -6, marginRight: -6, marginTop: -5 }}/>
            )
        }
        else {
            stars.push(
            <IconButton key={i} icon={"star-outline"} size={12} style={{ marginLeft: -6, marginRight: -6, marginTop: -5 }}/>
            )
        }
    }
    return (
        <View style={styles.container}>
            <View style={styles.infoRow}>
                <View style={styles.info}>
                    <IconButton icon={"thermometer"}/>
                    <View style={styles.infoText}>
                        <Text variant={"bodyMedium"} style={{color: theme.colors.primary}}>Temperature</Text>
                        <Text variant={"bodySmall"} style={{color: theme.colors.secondary}}>{info.temperature}</Text>
                    </View>
                </View>
                <View style={styles.infoRow}>
                    <IconButton icon={"recycle-variant"}/>
                    <View style={styles.infoText}>
                        <Text variant={"bodyMedium"} style={{color: theme.colors.primary}}>Cicle</Text>
                        <Text variant={"bodySmall"} style={{color: theme.colors.secondary}}>{info.cicle}</Text>
                    </View>
                </View>
            </View>
            <View style={styles.infoRow}>
                <View style={styles.info}>
                    <IconButton icon={"white-balance-sunny"}/>
                    <View style={styles.infoText}>
                        <Text variant={"bodyMedium"} style={{color: theme.colors.primary}}>Sunlight</Text>
                        <Text variant={"bodySmall"} style={{color: theme.colors.secondary}}>{info.sunlight}</Text>
                    </View>
                </View>
                <View style={styles.info}>
                    <IconButton icon={"scale-unbalanced"}/>
                    <View style={styles.infoText}>
                        <Text variant={"bodyMedium"} style={{color: theme.colors.primary}}>Difficulty</Text>
                        <View style={{flexDirection: "row", alignItems: "center"}}>
                            {stars}
                        </View>
                    </View>
                </View>
            </View>
            <View style={styles.infoRow}>
                <View style={styles.info}>
                    <IconButton icon={"water-outline"}/>
                    <View style={styles.infoText}>
                        <Text variant={"bodyMedium"} style={{color: theme.colors.primary}}>Humidity</Text>
                        <Text variant={"bodySmall"} style={{color: theme.colors.secondary}}>{info.humidity}</Text>
                    </View>
                </View>
                <View style={styles.info}>
                    <IconButton icon={"help-circle-outline"}/>
                    <View style={styles.infoText}>
                        <Text variant={"bodyMedium"} style={{color: theme.colors.primary}}>Plant type</Text>
                        <Text variant={"bodySmall"} style={{color: theme.colors.secondary}}>{info.plantType}</Text>
                    </View>
                </View>
            </View>
            <View style={styles.infoRow}>
                <View style={styles.info}>
                    <IconButton icon={"watering-can-outline"}/>
                    <View style={styles.infoText}>
                        <Text variant={"bodyMedium"} style={{color: theme.colors.primary}}>Water freq.</Text>
                        <Text variant={"bodySmall"} style={{color: theme.colors.secondary}}>{info.waterFreq}</Text>
                    </View>
                </View>
                <View style={styles.info}>
                    <IconButton icon={"sprout-outline"}/>
                    <View style={styles.infoText}>
                        <Text variant={"bodyMedium"} style={{color: theme.colors.primary}}>Soil Mix</Text>
                        <Text variant={"bodySmall"} style={{color: theme.colors.secondary}}>{info.soilMix}</Text>
                    </View>
                </View>
            </View>
        </View>

    )
}

const styles = StyleSheet.create({
    container: {
        flexDirection: "column", marginHorizontal: 30
    },
    infoRow: {
        flexDirection: "row", alignItems: "center", marginBottom: 8
    },
    info: {
        flexDirection: "row", alignItems: "center", width: 190
    },

    infoText: {
        flexDirection: "column",
        width: 110
    }
})