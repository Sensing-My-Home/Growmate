package pi.growmate.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import pi.growmate.datamodel.species.PlantSpecies;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.services.PlantSpeciesService;

@RestController
@RequestMapping("growmate/admin")
@CrossOrigin
public class AdminController {
    
    @Autowired
    private PlantSpeciesService plantSpeciesService;

    @GetMapping("/plants")
    public ResponseEntity<List<PlantSpecies>> getAllPlants(){
        return ResponseEntity.ok().body(plantSpeciesService.getListOfPlantSpecies());
    }

    @PostMapping("/addPlantSpecies")
    public ResponseEntity<PlantSpecies> addPlantSpecies(@RequestParam String common_name,
                                                        @RequestParam String cycle,
                                                        @RequestParam Double usual_size,
                                                        @RequestParam Boolean flowering,
                                                        @RequestParam int season,
                                                        @RequestParam String scientific_name,
                                                        @RequestParam String photo,
                                                        @RequestParam String leaf_color,
                                                        @RequestParam int optimal_humidity,
                                                        @RequestParam int optimal_temperature,
                                                        @RequestParam int optimal_luminosity,
                                                        @RequestParam int watering_frequency,
                                                        @RequestParam int family_id
                                                        ) throws ResourceNotFoundException{
        return ResponseEntity.ok().body(plantSpeciesService.addPlantSpecies(common_name, cycle, usual_size, flowering, season, scientific_name, photo, leaf_color, optimal_humidity, optimal_temperature, optimal_luminosity, watering_frequency, family_id));
    }


}
