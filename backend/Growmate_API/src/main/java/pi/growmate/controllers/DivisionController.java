package pi.growmate.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pi.growmate.datamodel.division.Division;
import pi.growmate.datamodel.plant.Plant;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.services.DivisionService;
import pi.growmate.utils.SuccessfulRequest;

import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("growmate/user")
@CrossOrigin
public class DivisionController {

    @Autowired
    private DivisionService divisionService;

    // Gets all of the divisions belonging to the user
    @GetMapping("/{userID}/divisions")
    public ResponseEntity<List<Division>> getDivisions(@PathVariable(value = "userID") Long userID) throws ResourceNotFoundException {
        return ResponseEntity.ok().body(divisionService.getUserDivisions(userID));
    }

    // Adds a new division, associated to the user
    @PostMapping("/{userID}/divisions")
    public ResponseEntity<SuccessfulRequest> addNewDivision(@PathVariable(value = "userID") Long userID,
                                            @RequestParam(name = "name") String name,
                                            @RequestParam(name = "luminosity") int lumType) throws ResourceNotFoundException {
        return ResponseEntity.ok().body(divisionService.addNewDivision(userID, name, lumType));
    }

    // Lists all of the Plants in a given Division
    @GetMapping("/{userID}/division/{divisionID}/plants")
    public ResponseEntity<List<Plant>> getPlantsOnDivision(@PathVariable(value = "userID") Long userID,
                                                           @PathVariable(value = "divisionID") Long divisionID) throws ResourceNotFoundException {
        return ResponseEntity.ok().body(divisionService.getPlantsOnDivision(userID, divisionID));
    }

    // Used to change a Plant from an old Division to a new Division (or to no Division, if newDivisionID is null)
    @PutMapping("/{userID}/division/{divisionID}/plants/{plantID}")
    public ResponseEntity<Plant> updatePlantOnDivision(@PathVariable(value = "userID") Long userID,
                                                       @PathVariable(value = "divisionID") Long divisionID,
                                                       @PathVariable(value = "plantID") Long plantID,
                                                       @RequestParam(value= "newDivisionID", required = false) Long newDivisionID) throws ResourceNotFoundException {
        return ResponseEntity.ok().body(divisionService.updatePlantDivisionStatus(userID, divisionID, plantID, newDivisionID));
    }

    // Deletes a Division from the database
    @DeleteMapping("/{userID}/division/{divisionID}")
    public ResponseEntity<Division> deleteDivision(@PathVariable(value = "userID") Long userID,
                                                @PathVariable(value = "divisionID") Long divisionID) throws ResourceNotFoundException {
        return ResponseEntity.ok().body(divisionService.deleteDivision(userID, divisionID));
    }
}
