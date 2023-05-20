import GreenBar from "../../components/GreenBar";
import BottomMenu from "../../components/BottomMenu";
import { Dimensions, View, FlatList } from "react-native";
import React, { useState, useEffect } from "react";
import { useTheme, ActivityIndicator } from "react-native-paper";
import AddPlantHeader from "../AddPlantScreen/components/AddPlantHeader";
import PlantItem from "./components/PlantItem";
import { getCategorySpecies } from "../../service/CategoryScreenService";

export default function CategoryScreen({ route }) {
  const [species, setSpecies] = useState([]);
  const [loading, setLoading] = useState(true);
  const [page, setPage] = useState(1);
  const [pageSize, setPageSize] = useState(10); // Number of species to render per page

  const loadMoreSpecies = () => {
    setPage(page + 1);
  };

  useEffect(() => {
    setLoading(true);
    getCategorySpecies(id, page, pageSize).then((newSpecies) => {
      setSpecies((prevSpecies) => [...prevSpecies, ...newSpecies]);
      setLoading(false);
    });
  }, [page, pageSize]);

  const screenHeight = Dimensions.get("screen").height;
  const { name, id, anonymous } = route.params;
  const theme = useTheme();

  const renderPlantItem = ({ item }) => (
    <PlantItem
      key={item.id}
      name={item.commonName}
      image={item.speciesPhoto}
      difficulty={item.difficulty}
      anonymous={anonymous}
      speciesID={item.id}
    />
  );

  return (
    <View style={{ height: screenHeight, backgroundColor: theme.colors.background }}>
      <GreenBar />
      <AddPlantHeader text={name} />
      <FlatList
        data={species}
        renderItem={renderPlantItem}
        keyExtractor={(item) => item.id.toString()}
        onEndReached={loadMoreSpecies}
        onEndReachedThreshold={0.5}
        ListFooterComponent={() => (loading ? <ActivityIndicator size="small" color={theme.colors.primary} /> : null)}
        maxToRenderPerBatch={10}
        initialNumToRender={10}
        removeClippedSubviews
      />
      <BottomMenu screenHeight={screenHeight} active={"magnify"} anonymous={anonymous} />
    </View>
  );
}
