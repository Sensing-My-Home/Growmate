package pi.growmate.repositories.plant;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pi.growmate.datamodel.plant.PlantSensor;

@Repository
public interface PlantSensorRepository extends JpaRepository<PlantSensor, Long> {
}
