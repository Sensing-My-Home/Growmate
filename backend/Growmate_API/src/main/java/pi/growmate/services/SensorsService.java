package pi.growmate.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pi.growmate.datamodel.division.Division;
import pi.growmate.datamodel.division.DivisionSensor;
import pi.growmate.datamodel.plant.Plant;
import pi.growmate.datamodel.plant.PlantSensor;
import pi.growmate.datamodel.user.User;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.repositories.division.DivisionSensorRepository;
import pi.growmate.repositories.plant.PlantSensorRepository;
import pi.growmate.repositories.user.UserRepository;
import pi.growmate.utils.SuccessfulRequest;

import java.util.List;

@Service
public class SensorsService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PlantSensorRepository plantSensorRepository;
    @Autowired
    private DivisionSensorRepository divisionSensorRepository;

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
