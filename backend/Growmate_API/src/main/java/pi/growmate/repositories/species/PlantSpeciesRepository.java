package pi.growmate.repositories.species;

import org.springframework.stereotype.Repository;

import pi.growmate.datamodel.species.PlantSpecies;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface PlantSpeciesRepository extends JpaRepository<PlantSpecies, Long>{
    
}
