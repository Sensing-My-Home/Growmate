package pi.growmate.services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pi.growmate.datamodel.plant.Plant;
import pi.growmate.datamodel.species.PlantSpecies;
import pi.growmate.datamodel.species.Season;
import pi.growmate.datamodel.task.TaskType;
import pi.growmate.datamodel.task.Task_Settings;
import pi.growmate.datamodel.task.Tasks_Current;
import pi.growmate.repositories.tasks.CurrentTaskRepository;
import pi.growmate.repositories.tasks.TaskSettingsRepository;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Month;

@Service
@Slf4j
public class AlgorithmsService {

    @Autowired
    TaskSettingsRepository taskSettingsRepository;
    @Autowired
    CurrentTaskRepository currentTaskRepository;

    // TASKS

    // This method adds new Tasks and new Task Settings for a newly created Plant
    //TODO: Test
    public void addTasksForNewPlant(Plant newPlant){

        // For each available TaskType, we will create a new Task Settings instance that will store the frequency in which that task will be made, using an algorithem depending on the Task.
        // Besides this, a new instance of Tasks_Current will be created, with the Date calculated based on the task frequency
        for(TaskType type: TaskType.values()){
            // Create a new Task Settings entity for this Plant and this type of Task
            Task_Settings settings = new Task_Settings();

            settings.setAutomatic(true);            // by default, new Plants will have tasks calculated automatically
            settings.setPlant(newPlant);
            settings.setTaskType(type);

            // Call the algorithm to calculate the frequency of the new Task Type
            settings.setTaskFrequency(calculateNewFrequency(newPlant, type));

            // Save the settings on the Task Settings Repository
            taskSettingsRepository.save(settings);

            // Create a new Tasks_Current entity for this TaskType and this Plant
            Tasks_Current task = new Tasks_Current();

            task.setPlant(newPlant);
            task.setTaskType(type);
            task.setName(createTaskName(newPlant, type));

            // Calculate the new Date for the Task
            calculateNewTaskDate(task);

            // Save the new Task
            currentTaskRepository.save(task);
        }
    }

    // This method implements the algorithm to calculate a new frequency for a Task, depending on the TaskType
    //TODO: Test
    public int calculateNewFrequency(Plant plant, TaskType taskType){
        PlantSpecies species = plant.getSpecies();

        return switch (taskType) {
            case FERTILIZER -> calculateFertilizingFrequency(species);
            case CHECK_PLANT -> calculateCheckingFrequency(species);
            case SOIL_CHANGE -> 300;
            case WATERING -> calculateNewWateringFrequency(species);
            default -> throw new IllegalArgumentException("Invalid task type: " + taskType);
        };
    }

    // This method calculates the next date for a task of a given type, associated with a Plant
    public void calculateNewTaskDate(Tasks_Current task){
        Plant plant = task.getPlant();
        TaskType taskType = task.getTaskType();

        // Getting the frequency of the Task from the Task Settings, and calculating the new Date for the Task
        Task_Settings settings = taskSettingsRepository.findFirstByPlantAndTaskType(plant, taskType);

        Date newDate = Date.valueOf(LocalDate.now().plusDays(settings.getTaskFrequency()));

        task.setTaskDate(newDate);
        currentTaskRepository.save(task);
    }

    // AUXILLIARY FUNCTIONS

    // Setting the name for a new Task
    public String createTaskName(Plant plant, TaskType taskType){
        String plantName = plant.getName();
        String taskName;

        switch (taskType) {
            case FERTILIZER -> taskName = "Fertilize " + plantName;
            case CHECK_PLANT -> taskName = "Check " + plantName + "'s condition";
            case SOIL_CHANGE -> taskName = "Change " + plantName + "'s soil mix";
            case WATERING -> taskName = "Water " + plantName;
            default -> throw new IllegalArgumentException("Invalid task type: " + taskType);
        };

        return taskName;
    }

    // Get the current Season
    public Season getCurrentSeason(){
        LocalDate today = LocalDate.now();
        int month = today.getMonthValue();

        if (month == Month.DECEMBER.getValue() || month == Month.JANUARY.getValue() || month == Month.FEBRUARY.getValue()) {
            return Season.WINTER;
        } else if (month == Month.MARCH.getValue() || month == Month.APRIL.getValue() || month == Month.MAY.getValue()) {
            return Season.SPRING;
        } else if (month == Month.JUNE.getValue() || month == Month.JULY.getValue() || month == Month.AUGUST.getValue()) {
            return Season.SUMMER;
        } else {
            return Season.FALL;
        }
    }

    // Calculating the watering frequency of a plant based on the species determined watering frequency, the species optimal humidity, and the current season
    public int calculateNewWateringFrequency(PlantSpecies species){
        Season currentSeason = getCurrentSeason();
        int wateringFrequency, optimalHumidity;

        switch (species.getWateringFrequency()) {
            case INFREQUENT -> wateringFrequency = 1;
            case AVERAGE -> wateringFrequency = 2;
            case FREQUENT -> wateringFrequency = 3;
            default -> throw new IllegalArgumentException("Invalid watering frequency");
        };

        switch (species.getOptimalHumidity()) {
            case LOW -> optimalHumidity = 1;
            case MEDIUM -> optimalHumidity = 2;
            case HIGH -> optimalHumidity = 3;
            default -> throw new IllegalArgumentException("Invalid humidity converter");
        };

        if(wateringFrequency == 1){
            if(currentSeason.equals(Season.FALL) || currentSeason.equals(Season.WINTER)){
                return 20;
            } else if (optimalHumidity == 3 || currentSeason.equals(Season.SUMMER)) {
                return 10;
            } else{
                return 14;
            }
        } else if (wateringFrequency == 2) {
            if(currentSeason.equals(Season.FALL) || currentSeason.equals(Season.WINTER)){
                return 10;
            } else if (optimalHumidity == 3 || currentSeason.equals(Season.SUMMER)) {
                return 6;
            } else{
                return 8;
            }
        } else{
            if(currentSeason.equals(Season.FALL) || currentSeason.equals(Season.WINTER)){
                return 7;
            } else if (optimalHumidity == 3 || currentSeason.equals(Season.SUMMER)) {
                return 3;
            } else{
                return 5;
            }
        }
    }

    // Calculating the frequency with which a plant should be checked, based on the species difficulty
    public int calculateCheckingFrequency(PlantSpecies species){
        return switch (species.getDifficulty()) {
            case 5 -> 7;
            case 4 -> 10;
            case 3 -> 14;
            case 2 -> 18;
            case 1 -> 21;
            default -> throw new IllegalArgumentException("Invalid watering frequency");
        };
    }

    // Calculating the fertilizing frequency of a plant based on the type of species, whether it's perennial or not, and the current season
    public int calculateFertilizingFrequency(PlantSpecies species){
        Season currentSeason = getCurrentSeason();

        String cycle = species.getCycle();
        String family = species.getFamily().getName();


        if(family.equals("Succulents and Cacti")){
            return 180;
        } else if (cycle.equals("Perennial")) {
            if(currentSeason.equals(Season.FALL) || currentSeason.equals(Season.WINTER)){
                return 84;
            } else{
                return 42;
            }
        } else {
            if(currentSeason.equals(Season.FALL) || currentSeason.equals(Season.WINTER)){
                return 56;
            } else{
                return 28;
            }
        }
    }
}
