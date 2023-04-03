package pi.growmate.repositories.plant;

import org.springframework.data.jpa.repository.JpaRepository;
import pi.growmate.datamodel.plant.Plant;

public interface PlantRepository extends JpaRepository<Plant, Long> {

}
