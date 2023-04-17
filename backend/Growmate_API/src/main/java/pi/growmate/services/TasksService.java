package pi.growmate.services;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pi.growmate.datamodel.plant.Plant;
import pi.growmate.datamodel.task.Tasks_Current;
import pi.growmate.datamodel.task.Tasks_History;
import pi.growmate.datamodel.user.User;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.repositories.tasks.CurrentTaskRepository;
import pi.growmate.repositories.tasks.HistoricTaskRepository;
import pi.growmate.repositories.user.UserRepository;
import pi.growmate.utils.SuccessfulRequest;

@Service
@Slf4j
public class TasksService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CurrentTaskRepository currentTaskRepository;

    @Autowired
    private HistoricTaskRepository historicTaskRepository;

    public List<Tasks_Current> getTasksForToday(Long userID) throws ResourceNotFoundException{
        User user = getUser(userID);
        Date today = new Date(System.currentTimeMillis()); //data de hoje
        log.info(today.toString());

        List<Tasks_Current> tasks = user.getPlants().stream()
                            .flatMap(plant -> plant.getCurrentTasks().stream())
                            .filter(task -> task.getTaskDate().toString().equals(today.toString()))
                            .collect(Collectors.toList());

        return tasks;
        
    }

    public List<Tasks_Current> getTasksToDo(Long userID) throws ResourceNotFoundException{
        User user = getUser(userID);
        List<Tasks_Current> tasks = user.getPlants().stream()
                            .flatMap(plant -> plant.getCurrentTasks().stream())
                            .collect(Collectors.toList());
        return tasks;
    }

    public List<Tasks_History> getTasksDone(Long userID) throws ResourceNotFoundException{
        User user = getUser(userID);
        List<Tasks_History> tasks = user.getPlants().stream()
                            .flatMap(plant -> plant.getHistoryTasks().stream())
                            .collect(Collectors.toList());
        return tasks;
    }

    //

    public List<Tasks_Current> getTasksForTodayPlant(Long userID, Long plantaID) throws ResourceNotFoundException{
        User user = getUser(userID);
        Plant planta = getPlant(user, plantaID);
        Date today = new Date(System.currentTimeMillis()); //data de hoje

        List<Tasks_Current> tasks = planta.getCurrentTasks().stream()
                            .filter(task -> task.getTaskDate().toString().equals(today.toString())).collect(Collectors.toList());

        return tasks;
    }

    public List<Tasks_Current> getTasksToDoPlant(Long userID, Long plantaID) throws ResourceNotFoundException{
        User user = getUser(userID);
        Plant planta = getPlant(user, plantaID);
        return new ArrayList<>(planta.getCurrentTasks());
    }

    public List<Tasks_History> getTasksDonePlant(Long userID, Long plantaID) throws ResourceNotFoundException{
        User user = getUser(userID);
        Plant planta = getPlant(user, plantaID);
        return new ArrayList<>(planta.getHistoryTasks());
    }

    public SuccessfulRequest updateTaskStatus(Long idUser, Long idPlant, Long idTask) throws ResourceNotFoundException{
        User user = getUser(idUser);
        Plant planta = getPlant(user, idPlant);

        // Finding the task in the list of current active tasks
        Tasks_Current task = planta.getCurrentTasks().stream()
                        .filter(t -> t.getId().equals(idTask))
                        .findFirst()
                        .orElseThrow(() -> new ResourceNotFoundException("Task with ID: " + idTask + " not found."));

        // Creating a record of the task to be added into the Task History table
        Tasks_History taskRecord = new Tasks_History();
        taskRecord.setName(task.getName());
        taskRecord.setTaskType(task.getTaskType());
        taskRecord.setPlant(planta);
        taskRecord.setDoneDate(Date.valueOf(LocalDate.now()));

        historicTaskRepository.save(taskRecord);

        //TODO: Calculate the new Date for the task, given the task type and the current Task Definition, and save it on the repository
        //currentTaskRepository.save(task);

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
