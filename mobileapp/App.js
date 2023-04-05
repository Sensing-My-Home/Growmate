import { Provider as PaperProvider, MD3LightTheme as DefaultTheme, } from 'react-native-paper'
import HomeScreen from "./screens/HomeScreen/HomeScreen"
import PlantScreen from "./screens/PlantScreen/PlantScreen";
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import myColors from "./colors"
import TasksScreen from "./screens/TasksScreen/TasksScreen";

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
        </Stack.Navigator>
      </NavigationContainer>
    </PaperProvider>
  );
}
