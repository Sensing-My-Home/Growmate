package pi.growmate.repositories.measurements;

import org.springframework.data.jpa.repository.JpaRepository;
import pi.growmate.datamodel.measurements.SoilQualityMeasurement;
import pi.growmate.datamodel.plant.PlantSensor;

public interface SoilQualityRepository extends JpaRepository<SoilQualityMeasurement, Long> {
    SoilQualityMeasurement findFirstBySensorOrderByPostDateDesc(PlantSensor sensor);
}
