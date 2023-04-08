package pi.growmate.controllers;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import pi.growmate.datamodel.plant.Plant;
import pi.growmate.datamodel.user.User;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.services.UserService;
import pi.growmate.utils.SuccessfulRequest;

@RestController
@RequestMapping("growmate/user")
public class UserController {

    @Autowired
    private UserService userService;

    // get informacoes do utilizador
    @GetMapping("/{idUser}")
    public ResponseEntity<User> getUserInfo(@PathVariable(value = "idUser") Long idUser) throws ResourceNotFoundException{
        return ResponseEntity.ok().body(userService.getUser(idUser));
    }

    // get informacao sobre lista de plantas do utilizador
    @GetMapping("/{idUser}/plants")
    public ResponseEntity<List<Plant>> getPlantsFromUser(@PathVariable(value = "idUser") Long idUser) throws ResourceNotFoundException{
        return ResponseEntity.ok().body(userService.getUserPlants(idUser));
    }

    // add new plant to invenory
    @PostMapping("/{idUser}/addplant")
    public ResponseEntity<SuccessfulRequest> addNewPlantToUserInventary(@PathVariable(value = "idUser") Long idUser,
                                                        @RequestParam(value = "plantName") String plantName,
                                                        @RequestParam(value = "photoURL", required = false) String URL,
                                                        @RequestParam(value = "species-id") Long speciesID, 
                                                        @RequestParam(value = "division-id", required = false) Long divisionID,
                                                        @RequestParam(value = "sensor-id", required = false) Long sensorID,
                                                        @RequestParam(value = "plantation-date", required = false) Date date) throws ResourceNotFoundException{
        
        return ResponseEntity.ok().body(userService.addNewPlantToUserInventary(idUser, plantName, URL, speciesID, divisionID, sensorID, date));
    }
}
