package pi.growmate.services;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pi.growmate.datamodel.division.Division;
import pi.growmate.datamodel.plant.Plant;
import pi.growmate.datamodel.plant.PlantCondition;
import pi.growmate.datamodel.sensors.PlantSensor;
import pi.growmate.datamodel.species.PlantSpecies;
import pi.growmate.datamodel.task.TaskType;
import pi.growmate.datamodel.task.Task_Settings;
import pi.growmate.datamodel.user.User;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.repositories.division.DivisionRepository;
import pi.growmate.repositories.plant.PlantRepository;
import pi.growmate.repositories.plant.PlantSensorRepository;
import pi.growmate.repositories.species.PlantSpeciesRepository;
import pi.growmate.repositories.tasks.TaskSettingsRepository;
import pi.growmate.repositories.user.UserRepository;
import pi.growmate.utils.SuccessfulRequest;

@Service
@Slf4j
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired 
    DivisionRepository divisionRepository;

    @Autowired
    PlantSpeciesRepository plantSpeciesRepository;

    @Autowired 
    PlantSensorRepository plantSensorRepository;

    @Autowired
    PlantRepository plantRepository;

    @Autowired
    TaskSettingsRepository taskSettingsRepository;

    @Autowired
    AlgorithmsService algorithmsService;

    // funcao que ira buscar informacao sobre o utilizador
    public User getUser(long userID) throws ResourceNotFoundException{
        return userRepository.findById(userID).orElseThrow(() -> new ResourceNotFoundException("User with ID: " + userID + " not found."));
    }

    // get da lista de plantas do utilizador
    public List<Plant> getUserPlants(long idUser) throws ResourceNotFoundException{
        return getUser(idUser).getPlants();
    }

    //post nova planta -> adicionar nova planta a lista de plantas do utilizador.
    public SuccessfulRequest addNewPlantToUserInventory(long user_id,
                                                        String plantName,
                                                        String photo,
                                                        Long species_id,
                                                        Long division_id,
                                                        Long sensor_id,
                                                        Date date) throws ResourceNotFoundException{

        Plant plant = new Plant();

        User user = getUser(user_id);

        plant.setOwner(user);
        plant.setName(plantName);
        plant.setPlantPhoto(photo);
        plant.setPlantCondition(PlantCondition.NORMAL);
        plant.setSpecies(getPlantSpecies(species_id));

        if(date != null){
            plant.setPlantationDate(date);
        }else{
            plant.setPlantationDate(Date.valueOf(LocalDate.now()));
        }

        if (division_id != null) {
            Division division = getDivision(user, division_id);
            plant.setDivision(division);
        }

        if (sensor_id != null) {
            PlantSensor sensor = getPlantSensor(sensor_id);
            plant.addSensor(sensor);
        }
        
        plantRepository.save(plant);

        // Create new entries into the Task Settings Repository, relating to the newly added plant, one for each type of task
        algorithmsService.addTasksForNewPlant(plant);

        return new SuccessfulRequest("The plant was added successfully!");
    }

    // funcoes auxiliares
    private Division getDivision(User user, long divisionID) throws ResourceNotFoundException {
        return user.getDivisions().stream()
                .filter(d -> d.getId().equals(divisionID))
                .findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("Division with ID: " + divisionID + " not found."));
    }

    private PlantSpecies getPlantSpecies(long id_species) throws ResourceNotFoundException{
        return plantSpeciesRepository.findById(id_species).orElseThrow(() -> new ResourceNotFoundException("Plant species with ID: " + id_species + " not found."));
    }

    private PlantSensor getPlantSensor(long id_sensor) throws ResourceNotFoundException{
        return plantSensorRepository.findById(id_sensor).orElseThrow(() -> new ResourceNotFoundException("PlantSensor with id " + id_sensor + " not found."));
    }



}
