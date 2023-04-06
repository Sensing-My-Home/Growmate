import { Provider as PaperProvider, MD3LightTheme as DefaultTheme, } from 'react-native-paper'
import HomeScreen from "./screens/HomeScreen/HomeScreen"
import PlantScreen from "./screens/PlantScreen/PlantScreen";
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import myColors from "./colors"
import TasksScreen from "./screens/TasksScreen/TasksScreen";
import SpeciesProfileScreen from "./screens/SpeciesProfileScreen/SpeciesProfileScreen";
import AddPlantScreen from "./screens/AddPlantScreen/AddPlantScreen";
import AssociatePlantScreen from "./screens/AssociatePlantScreen/AssociatePlantScreen";

const Stack = createNativeStackNavigator();

export default function App() {
  const theme = {
    ...DefaultTheme,
    colors: myColors
  }

  return (
    <PaperProvider theme={theme}>
      <NavigationContainer>
        <Stack.Navigator
          screenOptions={{
            headerShown: false
          }}
        >
          <Stack.Screen
            name="Home"
            component={HomeScreen}
          />
          <Stack.Screen
            name="Plant"
            component={PlantScreen}
          />
          <Stack.Screen
              name="Tasks"
              component={TasksScreen}
          />
          <Stack.Screen
              name="SpeciesProfile"
              component={SpeciesProfileScreen}
          />
          <Stack.Screen
              name="AddPlant"
              component={AddPlantScreen}
          />
          <Stack.Screen
              name="AssociatePlant"
              component={AssociatePlantScreen}
          />
        </Stack.Navigator>
      </NavigationContainer>
    </PaperProvider>
  );
}
