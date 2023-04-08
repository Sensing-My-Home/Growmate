package pi.growmate.repositories.plant;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pi.growmate.datamodel.plant.Plant;

@Repository
public interface PlantRepository extends JpaRepository<Plant, Long> {

}
