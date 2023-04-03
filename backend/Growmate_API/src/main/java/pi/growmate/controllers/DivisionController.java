package pi.growmate.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pi.growmate.datamodel.division.Division;
import pi.growmate.datamodel.plant.Plant;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.services.DivisionService;

import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("growmate/user")
public class DivisionController {

    @Autowired
    private DivisionService divisionService;

    @GetMapping("/{userID}/divisions")
    public ResponseEntity<List<Division>> getDivisions(@PathVariable(value = "userID") Long userID) throws ResourceNotFoundException {
        return ResponseEntity.ok().body(divisionService.getUserDivisions(userID));
    }

    @GetMapping("/{userID}/division/{divisionID}/plants")
    public ResponseEntity<List<Plant>> getPlantsOnDivision(@PathVariable(value = "userID") Long userID,
                                                           @PathVariable(value = "divisionID") Long divisionID) throws ResourceNotFoundException {
        return ResponseEntity.ok().body(divisionService.getPlantsOnDivision(userID, divisionID));
    }

    @PutMapping("/{userID}/division/{divisionID}/plants/{plantID}")
    public ResponseEntity<Plant> updatePlantOnDivision(@PathVariable(value = "userID") Long userID,
                                                       @PathVariable(value = "divisionID") Long divisionID,
                                                       @PathVariable(value = "plantID") Long plantID,
                                                       @RequestParam(value= "newDivisionID", required = false) Long newDivisionID) throws ResourceNotFoundException {
        return ResponseEntity.ok().body(divisionService.updatePlantDivisionStatus(userID, divisionID, plantID, newDivisionID));
    }

    @DeleteMapping("/{userID}/division/{divisionID}")
    public ResponseEntity<Division> deleteDivision(@PathVariable(value = "userID") Long userID,
                                                @PathVariable(value = "divisionID") Long divisionID) throws ResourceNotFoundException {
        return ResponseEntity.ok().body(divisionService.deleteDivision(userID, divisionID));
    }
}
