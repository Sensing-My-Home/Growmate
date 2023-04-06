package pi.growmate.repositories.measurements;

import org.springframework.data.jpa.repository.JpaRepository;
import pi.growmate.datamodel.division.DivisionSensor;
import pi.growmate.datamodel.measurements.AirQualityMeasurement;


public interface AirQualityRepository extends JpaRepository<AirQualityMeasurement, Long> {
    AirQualityMeasurement findFirstBySensorOrderByPostDateDesc(DivisionSensor sensor);
}
