package pi.growmate.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pi.growmate.datamodel.division.Division;
import pi.growmate.datamodel.division.DivisionSensor;
import pi.growmate.datamodel.measurements.Measurement;
import pi.growmate.datamodel.plant.PlantSensor;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.services.SensorsService;
import pi.growmate.utils.SuccessfulRequest;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("growmate/user")
@CrossOrigin
public class SensorsController {
    @Autowired
    private SensorsService sensorsService;

    public SensorsController(SensorsService sensorsService) {
        this.sensorsService = sensorsService;
    }

    // Gets the Sensors associated with a given Division
    @GetMapping("/{userID}/sensors/division/{divisionID}")
    public ResponseEntity<List<DivisionSensor>> getSensorsOnDivision(@PathVariable(value = "userID") Long userID,
                                                                     @PathVariable(value = "divisionID") Long divisionID) throws ResourceNotFoundException {
        return ResponseEntity.ok().body(sensorsService.getDivisionSensors(userID, divisionID));
    }

    // Gets the Sensors associated with a given Plant
    @GetMapping("/{userID}/sensors/plant/{plantID}")
    public ResponseEntity<List<PlantSensor>> getPlantSensors(@PathVariable(value = "userID") Long userID,
                                                             @PathVariable(value = "plantID") Long plantID) throws ResourceNotFoundException {
        return ResponseEntity.ok().body(sensorsService.getPlantSensors(userID, plantID));
    }

    // Creates a new Sensor (0 - Division Sensor; 1 - Plant Sensor)
    @PostMapping("/{userID}/sensors/")
    public ResponseEntity<SuccessfulRequest> addNewSensor(@PathVariable(value = "userID") Long userID,
                                                          @RequestParam(name = "sensorType") int type,
                                                          @RequestParam(name = "sensorName") String name,
                                                          @RequestParam(name = "sensorCode") String code,
                                                          @RequestParam(name = "ownerID") long ownerID) throws ResourceNotFoundException {
        return ResponseEntity.ok().body(sensorsService.addNewSensor(userID, type, name, code, ownerID));
    }

    // Getting the last measurements from all sensors related to a user
    //TODO: Not Tested
    @PostMapping("/{userID}/sensors/last")
    public ResponseEntity<Map<String, Measurement>> returnLatestMeasurements(@PathVariable(value = "userID") Long userID) throws ResourceNotFoundException {
        return ResponseEntity.ok().body(sensorsService.getLatestMeasurements(userID));
    }

    // Get the measurements of a plant in the past 3 days
    //TODO: Not Tested
    @PostMapping("/{userID}/sensors/last/plant/{plantID}")
    public ResponseEntity<Map<String, List<Measurement>>> returnMeasurementsPlant(@PathVariable(value = "userID") Long userID,
                                                                            @PathVariable(value = "plantID") Long plantID) throws ResourceNotFoundException {
        return ResponseEntity.ok().body(sensorsService.getThreeDaysMeasurements(userID, plantID));
    }
}
