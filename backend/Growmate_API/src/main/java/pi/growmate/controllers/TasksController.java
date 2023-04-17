package pi.growmate.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import pi.growmate.datamodel.task.Tasks_Current;
import pi.growmate.datamodel.task.Tasks_History;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.services.TasksService;
import pi.growmate.utils.SuccessfulRequest;

@RestController
@RequestMapping("growmate/user/tasks")
@CrossOrigin
public class TasksController {

    @Autowired
    TasksService tasksService;

    // Gets all the tasks related to a User's inventory for the current Day
    @GetMapping("{idUser}/today")
    public ResponseEntity<List<Tasks_Current>> getTasksForToday(@PathVariable(value = "idUser") Long idUser) throws ResourceNotFoundException{
        return ResponseEntity.ok().body(tasksService.getTasksForToday(idUser));
    }

    // Gets all the tasks to be completed by a User
    @GetMapping("{idUser}/todo")
    public ResponseEntity<List<Tasks_Current>> getTasksToDo(@PathVariable(value = "idUser") Long idUser) throws ResourceNotFoundException{
        return ResponseEntity.ok().body(tasksService.getTasksToDo(idUser));
    }

    // Gets all the tasks done by a User
    @GetMapping("{idUser}/done")
    public ResponseEntity<List<Tasks_History>> getTasksDone(@PathVariable(value = "idUser") Long idUser) throws ResourceNotFoundException{
        return ResponseEntity.ok().body(tasksService.getTasksDone(idUser));
    }

    // Gets all the tasks to be done today for a Plant
    @GetMapping("{idUser}/plant/{idPlant}/today")
    public ResponseEntity<List<Tasks_Current>> getTasksForTodayPlant(@PathVariable(value = "idUser") Long idUser,
                                                                     @PathVariable(value = "idPlant") Long idPlant) throws ResourceNotFoundException{
        
        return ResponseEntity.ok().body(tasksService.getTasksForTodayPlant(idUser, idPlant));
    }

    // Gets all the tasks to be done for a Plant
    @GetMapping("{idUser}/plant/{idPlant}/todo")
    public ResponseEntity<List<Tasks_Current>> getTasksToDoPlant(@PathVariable(value = "idUser") Long idUser,
                                                                 @PathVariable(value = "idPlant") Long idPlant) throws ResourceNotFoundException{
        
        return ResponseEntity.ok().body(tasksService.getTasksToDoPlant(idUser, idPlant));
    }

    // Gets all the completed tasks for a Plant
    @GetMapping("{idUser}/plant/{idPlant}/done")
    public ResponseEntity<List<Tasks_History>> getTasksDonePlant(@PathVariable(value = "idUser") Long idUser,
                                                                 @PathVariable(value = "idPlant") Long idPlant) throws ResourceNotFoundException{
        
        return ResponseEntity.ok().body(tasksService.getTasksDonePlant(idUser, idPlant));
    }

    // Changes the status of a Task to completed. A new task of the same type for that plant will be created, while the current task is saved in the Tasks History table.
    @PutMapping("{idUser}/plant/{idPlant}/updateTask/{idTask}")
    public ResponseEntity<SuccessfulRequest> UpdateTasksToBeDone(@PathVariable(value = "idUser") Long idUser,
                                                                @PathVariable(value = "idPlant") Long idPlant,
                                                                @PathVariable(value = "idTask") Long idTask) throws ResourceNotFoundException{
        return ResponseEntity.ok().body(tasksService.updateTaskStatus(idUser, idPlant, idTask));
        
    }

    //TODO: Test new model
    //TODO: Check new model and see what other API methods we might need
}
