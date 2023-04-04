package pi.growmate.services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pi.growmate.datamodel.division.Division;
import pi.growmate.datamodel.plant.Plant;
import pi.growmate.datamodel.species.OptimalLuminosity;
import pi.growmate.datamodel.user.User;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.repositories.division.DivisionRepository;
import pi.growmate.repositories.plant.PlantRepository;
import pi.growmate.repositories.user.UserRepository;
import pi.growmate.utils.SuccessfulRequest;

import java.util.List;

@Service
@Slf4j
public class DivisionService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private DivisionRepository divisionRepository;
    @Autowired
    private PlantRepository plantRepository;

    public List<Division> getUserDivisions(Long userID) throws ResourceNotFoundException {
        log.info(String.valueOf(userID));
        User user = userRepository.findById(userID).orElseThrow(() -> new ResourceNotFoundException("User with ID: " + userID + " not found."));

        for (Division d : user.getDivisions()) {
            log.info("Element: {}", d.toString());
        }

        return user.getDivisions();
    }

    public List<Plant> getPlantsOnDivision(Long userID, Long divisionID) throws ResourceNotFoundException {
        User user = userRepository.findById(userID).orElseThrow(() -> new ResourceNotFoundException("User with ID: " + userID + " not found."));

        Division div = user.getDivisions().stream()
                .filter(d -> d.getId().equals(divisionID))
                .findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("Division with ID: " + divisionID + " not found."));

        return div.getPlantsOnDivision();
    }

    public Plant updatePlantDivisionStatus(Long userID, Long divisionID, Long plantID, Long newDivisionID) throws ResourceNotFoundException {
        User user = userRepository.findById(userID).orElseThrow(() -> new ResourceNotFoundException("User with ID: " + userID + " not found."));

        Division div = user.getDivisions().stream()
                .filter(d -> d.getId().equals(divisionID))
                .findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("Division with ID: " + divisionID + " not found."));

        Plant plant = div.getPlantsOnDivision().stream()
                .filter(p -> p.getId().equals(plantID))
                .findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("Plant with ID: " + plantID + " not found."));

        if(newDivisionID != null){
            Division newDiv = user.getDivisions().stream()
                    .filter(d -> d.getId().equals(newDivisionID))
                    .findFirst()
                    .orElseThrow(() -> new ResourceNotFoundException("Division with ID: " + newDivisionID + " not found."));

            plant.setDivision(newDiv);
            div.getPlantsOnDivision().remove(plant);
            newDiv.getPlantsOnDivision().add(plant);
        }else{
            plant.setDivision(null);
        }

        plantRepository.save(plant);
        return plant;
    }

    public Division deleteDivision(Long userID, Long divisionID) throws ResourceNotFoundException {
        User user = userRepository.findById(userID).orElseThrow(() -> new ResourceNotFoundException("User with ID: " + userID + " not found."));

        /*
        Division div = user.getDivisions().stream()
                .filter(d -> d.getId().equals(divisionID))
                .findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("Division with ID: " + divisionID + " not found."));
        */

        Division div = divisionRepository.findById(divisionID).orElseThrow(() -> new ResourceNotFoundException("User with ID: " + userID + " not found."));

        List<Division> userDivisions = user.getDivisions();
        userDivisions.remove(div);
        user.setDivisions(userDivisions);
        userRepository.save(user);


        divisionRepository.delete(div);
        return div;
    }

    public SuccessfulRequest addNewDivision(Long userID, String name, int luminosityType) throws ResourceNotFoundException {
        User user = userRepository.findById(userID).orElseThrow(() -> new ResourceNotFoundException("User with ID: " + userID + " not found."));
        Division div = new Division();

        switch (luminosityType) {
            case 0 -> div.setLuminosity(OptimalLuminosity.LOW);
            case 1 -> div.setLuminosity(OptimalLuminosity.MEDIUM);
            case 2 -> div.setLuminosity(OptimalLuminosity.HIGH);
            case 3 -> div.setLuminosity(OptimalLuminosity.SUNNY);
            default -> throw new IllegalArgumentException("Invalid luminosity converter integer: " + luminosityType);
        };

        div.setName(name);
        div.setOwner(user);

        divisionRepository.save(div);

        return new SuccessfulRequest("Division added successfully!");
    }
}
