import { Provider as PaperProvider, MD3LightTheme as DefaultTheme, } from 'react-native-paper'
import HomeScreen from "./screens/HomeScreen/HomeScreen"
import PlantScreen from "./screens/PlantScreen/PlantScreen";
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import myColors from "./colors";
import 'react-native-gesture-handler';
import { gestureHandlerRootHOC } from 'react-native-gesture-handler';

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
          </Stack.Navigator>
        </NavigationContainer>
      </PaperProvider>
  );
}
