package pi.growmate.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pi.growmate.datamodel.division.Division;
import pi.growmate.datamodel.division.DivisionSensor;
import pi.growmate.datamodel.measurements.AirQualityMeasurement;
import pi.growmate.datamodel.measurements.AirTemperatureMeasurement;
import pi.growmate.datamodel.measurements.Measurement;
import pi.growmate.datamodel.measurements.SoilQualityMeasurement;
import pi.growmate.datamodel.plant.Plant;
import pi.growmate.datamodel.plant.PlantSensor;
import pi.growmate.datamodel.user.User;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.repositories.division.DivisionSensorRepository;
import pi.growmate.repositories.measurements.AirQualityRepository;
import pi.growmate.repositories.measurements.AirTemperatureRepository;
import pi.growmate.repositories.measurements.SoilQualityRepository;
import pi.growmate.repositories.plant.PlantSensorRepository;
import pi.growmate.repositories.user.UserRepository;
import pi.growmate.utils.SuccessfulRequest;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class SensorsService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PlantSensorRepository plantSensorRepository;
    @Autowired
    private DivisionSensorRepository divisionSensorRepository;
    @Autowired
    private SoilQualityRepository soilQualityRepository;
    @Autowired
    private AirQualityRepository airQualityRepository;
    @Autowired
    private AirTemperatureRepository airTemperatureRepository;

    public List<DivisionSensor> getDivisionSensors(long userID, long divisionID) throws ResourceNotFoundException {
        User user = this.checkIfUserExists(userID);
        Division div = this.getDivision(user, divisionID);

        return div.getSensors();
    }

    public List<PlantSensor> getPlantSensors(long userID, long plantID) throws ResourceNotFoundException {
        User user = this.checkIfUserExists(userID);

        Plant plant = this.getPlant(user, plantID);

        return plant.getSensors();
    }

    public SuccessfulRequest addNewSensor(long userID, int type, String name, String  code, long ownerID) throws ResourceNotFoundException {
        User user = this.checkIfUserExists(userID);

        if(type == 0){ // Division Sensor
            Division div = this.getDivision(user, ownerID);
            DivisionSensor newSensor = new DivisionSensor();

            newSensor.setName(name);
            newSensor.setSensorCode(code);
            newSensor.setOwner(user);
            newSensor.setDivision(div);

            divisionSensorRepository.save(newSensor);
        }else{  // Plant Sensor
            Plant plant = this.getPlant(user, ownerID);
            PlantSensor newSensor = new PlantSensor();

            newSensor.setName(name);
            newSensor.setSensorCode(code);
            newSensor.setOwner(user);
            newSensor.setPlant(plant);

            plantSensorRepository.save(newSensor);
        }

        return new SuccessfulRequest("Sensor added succesfully!");
    }

    public Map<String, Measurement> getLatestMeasurements(long userID) throws ResourceNotFoundException{
        User user = this.checkIfUserExists(userID);

        List<Plant> userPlants = user.getPlants();
        List<Division> userDivisions = user.getDivisions();

        // Getting all of the sensors associated with this User's account
        List<PlantSensor> allPlantSensors = userPlants.stream()
                                                        .flatMap(plant -> plant.getSensors().stream())
                                                        .toList();

        List<DivisionSensor> allDivisionSensors = userDivisions.stream()
                                                        .flatMap(division -> division.getSensors().stream())
                                                        .toList();

        // From each sensor, get the latest measurement
        Map<String, SoilQualityMeasurement> soilQualityMeasurements = allPlantSensors.stream()
                                                                    .map(sensor -> soilQualityRepository.findFirstBySensorOrderByPostDateDesc(sensor))
                                                                    .collect(Collectors.toMap(
                                                                            sensor -> sensor.getSensor().getPlant().getName() + "_soilq",
                                                                            Function.identity()
                                                                    ));

        Map<String, AirQualityMeasurement> airQualityMeasurements = allDivisionSensors.stream()
                .map(sensor -> airQualityRepository.findFirstBySensorOrderByPostDateDesc(sensor))
                .collect(Collectors.toMap(
                        sensor -> sensor.getSensor().getDivision().getName() + "_airq",
                        Function.identity()
                ));

        Map<String, AirTemperatureMeasurement> airTemperatureMeasurements = allDivisionSensors.stream()
                .map(sensor -> airTemperatureRepository.findFirstBySensorOrderByPostDateDesc(sensor))
                .collect(Collectors.toMap(
                        sensor -> sensor.getSensor().getDivision().getName() + "_airtemp",
                        Function.identity()
                ));

        // Add the measurements to the return list

        return Stream.of(soilQualityMeasurements.entrySet(), airQualityMeasurements.entrySet(), airTemperatureMeasurements.entrySet())
                .flatMap(Collection::stream)
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        Map.Entry::getValue
                ));

    }

    // Auxilliary functions
    private User checkIfUserExists(long userID) throws ResourceNotFoundException {
        return userRepository.findById(userID).orElseThrow(() -> new ResourceNotFoundException("User with ID: " + userID + " not found."));
    }

    private Division getDivision(User user, long divisionID) throws ResourceNotFoundException {
        return user.getDivisions().stream()
                .filter(d -> d.getId().equals(divisionID))
                .findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("Division with ID: " + divisionID + " not found."));
    }

    private Plant getPlant(User user, long plantID) throws ResourceNotFoundException {
        return user.getPlants().stream()
                .filter(d -> d.getId().equals(plantID))
                .findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("Plant with ID: " + plantID + " not found."));
    }
}
