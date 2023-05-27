package pi.growmate.services;

import java.sql.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pi.growmate.datamodel.plant.Plant;
import pi.growmate.datamodel.task.Task;
import pi.growmate.datamodel.user.User;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.repositories.tasks.TaskRepository;
import pi.growmate.repositories.user.UserRepository;
import pi.growmate.utils.SuccessfulRequest;

@Service
@Slf4j
public class TasksService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TaskRepository taskRepository;

    public List<Task> getTasksForToday(Long userID) throws ResourceNotFoundException{
        User user = getUser(userID);
        Date today = new Date(System.currentTimeMillis()); //data de hoje
        log.info(today.toString());
        List<Task> tasks = user.getPlants().stream()
                            .flatMap(plant -> plant.getPlantTasks().stream())
                            .filter(task -> task.getTaskDate().toString().equals(today.toString()))
                            .collect(Collectors.toList()); 
        return tasks;
        
    }

    public List<Task> getTasksToDo(Long userID) throws ResourceNotFoundException{
        User user = getUser(userID);
        List<Task> tasks = user.getPlants().stream()
                            .flatMap(plant -> plant.getPlantTasks().stream())
                            .filter(task -> !task.isDone()).collect(Collectors.toList()); 
        return tasks;
    }

    public List<Task> getTasksDone(Long userID) throws ResourceNotFoundException{
        User user = getUser(userID);
        List<Task> tasks = user.getPlants().stream()
                            .flatMap(plant -> plant.getPlantTasks().stream())
                            .filter(task -> task.isDone()).collect(Collectors.toList()); 
        return tasks;
    }

    //

    public List<Task> getTasksForTodayPlant(Long userID, Long plantaID) throws ResourceNotFoundException{
        User user = getUser(userID);
        Plant planta = getPlant(user, plantaID);
        Date today = new Date(System.currentTimeMillis()); //data de hoje
        List<Task> tasks = planta.getPlantTasks().stream()
                            .filter(task -> task.getTaskDate().toString().equals(today.toString())).collect(Collectors.toList()); 
        return tasks;
        
    }

    public List<Task> getTasksToDoPlant(Long userID, Long plantaID) throws ResourceNotFoundException{
        User user = getUser(userID);
        Plant planta = getPlant(user, plantaID);
        List<Task> tasks = planta.getPlantTasks().stream()
                        .filter(task -> !task.isDone()).collect(Collectors.toList()); 
        return tasks;
    }

    public List<Task> getTasksDonePlant(Long userID, Long plantaID) throws ResourceNotFoundException{
        User user = getUser(userID);
        Plant planta = getPlant(user, plantaID);
        List<Task> tasks = planta.getPlantTasks().stream()
                        .filter(task -> task.isDone()).collect(Collectors.toList()); 
        return tasks;
    }

    public SuccessfulRequest updateTaskStatus(Long idUser, Long idPlant, Long idTask, Boolean bol) throws ResourceNotFoundException{
        User user = getUser(idUser);
        Plant planta = getPlant(user, idPlant);
        Task task = planta.getPlantTasks().stream()
                        .filter(t -> t.getId().equals(idTask))
                        .findFirst()
                        .orElseThrow(() -> new ResourceNotFoundException("Task with ID: " + idTask + " not found."));
        task.setTaskDone(bol);
        
        taskRepository.save(task);
        return new SuccessfulRequest("Updated task with success");
    }
    
    // Auxilliary functions
    private User getUser(long userID) throws ResourceNotFoundException {
        return userRepository.findById(userID).orElseThrow(() -> new ResourceNotFoundException("User with ID: " + userID + " not found."));
    }

    private Plant getPlant(User user, long plantID) throws ResourceNotFoundException {
        return user.getPlants().stream()
                .filter(d -> d.getId().equals(plantID))
                .findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("Plant with ID: " + plantID + " not found."));
    }


}
