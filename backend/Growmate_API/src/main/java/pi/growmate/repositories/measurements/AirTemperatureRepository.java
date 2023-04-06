package pi.growmate.repositories.measurements;

import org.springframework.data.jpa.repository.JpaRepository;
import pi.growmate.datamodel.division.DivisionSensor;
import pi.growmate.datamodel.measurements.AirTemperatureMeasurement;

public interface AirTemperatureRepository extends JpaRepository<AirTemperatureMeasurement, Long> {
    AirTemperatureMeasurement findFirstBySensorOrderByPostDateDesc(DivisionSensor sensor);
}
