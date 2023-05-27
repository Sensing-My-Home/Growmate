package pi.growmate.controllers;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import pi.growmate.datamodel.plant.Plant;
import pi.growmate.datamodel.species.PlantSpecies;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.services.PlantService;
import pi.growmate.utils.SuccessfulRequest;

@RestController
@RequestMapping("growmate/user")
@CrossOrigin
public class PlantInventoryController {

    @Autowired
    private PlantService plantService;

    // get information about a plant
    @GetMapping("{idUser}/inventory/{idPlanta}")
    public ResponseEntity<Plant> getPlantInfo(@PathVariable(value = "idUser") Long idUser,  
                                              @PathVariable(value = "idPlanta") Long idPlanta) throws ResourceNotFoundException{
                                                  
        return ResponseEntity.ok().body(plantService.getPlantInfo(idUser, idPlanta));
    }

    @GetMapping("{idUser}/inventory/{idPlanta}/speciesinfo")
    public ResponseEntity<PlantSpecies> getPlantSpeciesInfo(@PathVariable(value = "idUser") Long idUser,   
                                                            @PathVariable(value = "idPlanta") Long idPlanta) throws ResourceNotFoundException{

        return ResponseEntity.ok().body(plantService.getPlantSpeciesInfo(idUser, idPlanta));
                 
    }

    @DeleteMapping("{idUser}/inventory/{idPlanta}")
    public ResponseEntity<SuccessfulRequest> removePlant(@PathVariable(value = "idUser") Long idUser,
                                                        @PathVariable(value = "idPlanta") Long idPlanta) throws ResourceNotFoundException{
        return ResponseEntity.ok().body(plantService.removePlant(idUser, idPlanta));
    }

    //String nome, String photo, Long division_id, Long sensor_id, Date plantation_date
    @PutMapping("{idUser}/inventory/{idPlanta}")
    public ResponseEntity<Plant> updatePlantInfo(@PathVariable(value = "idUser") Long idUser,
                                                @PathVariable(value = "idPlanta") Long idPlanta,
                                                @RequestParam(value = "nomePlanta", required = false) String nomePlanta,
                                                @RequestParam(value = "photoPlanta", required = false) String photoPlanta, 
                                                @RequestParam(value = "division-id", required = false) Long division_id,
                                                @RequestParam(value = "sensor-id", required = false) Long sensor_id,
                                                @RequestParam(value = "plantation-date", required = false) Date date
                                                ) throws ResourceNotFoundException{
        return ResponseEntity.ok().body(plantService.updatePlantInfo(idUser, idPlanta, nomePlanta, photoPlanta, division_id, sensor_id, date));

    }
}
