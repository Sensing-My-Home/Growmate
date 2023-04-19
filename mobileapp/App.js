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

import 'react-native-gesture-handler';
import { gestureHandlerRootHOC } from 'react-native-gesture-handler';
import DiscoverPlantsScreen from "./screens/DiscoverPlantsScreen/DiscoverPlantsScreen";
import CategoryScreen from "./screens/CategoryScreen/CategoryScreen";

import { enGB, registerTranslation } from 'react-native-paper-dates'
import AddDivisionScreen from "./screens/AddDivisionScreen/AddDivisionScreen";
registerTranslation('en-GB', enGB)


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
            component={gestureHandlerRootHOC(HomeScreen)}
          />
          <Stack.Screen
            name="Plant"
            component={gestureHandlerRootHOC(PlantScreen)}
          />
          <Stack.Screen
              name="Tasks"
              component={gestureHandlerRootHOC(TasksScreen)}
          />
          <Stack.Screen
              name="SpeciesProfile"
              component={gestureHandlerRootHOC(SpeciesProfileScreen)}
          />
          <Stack.Screen
              name="AddPlant"
              component={AddPlantScreen}
          />
          <Stack.Screen
              name="AssociatePlant"
              component={AssociatePlantScreen}
          />
          <Stack.Screen
              name="DiscoverPlants"
              component={DiscoverPlantsScreen}
          />
          <Stack.Screen
              name="Category"
              component={CategoryScreen}
          />
          <Stack.Screen name="AddDivision"
                        component={AddDivisionScreen}
          />

        </Stack.Navigator>
      </NavigationContainer>
    </PaperProvider>
  );
}
