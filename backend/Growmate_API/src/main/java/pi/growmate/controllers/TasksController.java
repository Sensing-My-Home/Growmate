package pi.growmate.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import pi.growmate.datamodel.task.Task;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.services.TasksService;
import pi.growmate.utils.SuccessfulRequest;

@RestController
@RequestMapping("growmate/user/tasks")
public class TasksController {

    @Autowired
    TasksService tasksService;
 
    @GetMapping("{idUser}/today")
    public ResponseEntity<List<Task>> getTasksForToday(@PathVariable(value = "idUser") Long idUser) throws ResourceNotFoundException{
        return ResponseEntity.ok().body(tasksService.getTasksForToday(idUser));
    }

    @GetMapping("{idUser}/todo")
    public ResponseEntity<List<Task>> getTasksToDo(@PathVariable(value = "idUser") Long idUser) throws ResourceNotFoundException{
        return ResponseEntity.ok().body(tasksService.getTasksToDo(idUser));
    }

    @GetMapping("{idUser}/done")
    public ResponseEntity<List<Task>> getTasksDone(@PathVariable(value = "idUser") Long idUser) throws ResourceNotFoundException{
        return ResponseEntity.ok().body(tasksService.getTasksDone(idUser));
    }

    @GetMapping("{idUser}/plant/{idPlant}/today")
    public ResponseEntity<List<Task>> getTasksForTodayPlant(@PathVariable(value = "idUser") Long idUser,
                                                            @PathVariable(value = "idPlant") Long idPlant) throws ResourceNotFoundException{
        
        return ResponseEntity.ok().body(tasksService.getTasksForTodayPlant(idUser, idPlant));
    }

    @GetMapping("{idUser}/plant/{idPlant}/todo")
    public ResponseEntity<List<Task>> getTasksToDoPlant(@PathVariable(value = "idUser") Long idUser,
                                                        @PathVariable(value = "idPlant") Long idPlant) throws ResourceNotFoundException{
        
        return ResponseEntity.ok().body(tasksService.getTasksToDoPlant(idUser, idPlant));
    }

    @GetMapping("{idUser}/plant/{idPlant}/done")
    public ResponseEntity<List<Task>> getTasksDonePlant(@PathVariable(value = "idUser") Long idUser,
                                                        @PathVariable(value = "idPlant") Long idPlant) throws ResourceNotFoundException{
        
        return ResponseEntity.ok().body(tasksService.getTasksDonePlant(idUser, idPlant));
    }

    @PutMapping("{idUser}/plant/{idPlant}/updateTask/{idTask}")
    public ResponseEntity<SuccessfulRequest> UpdateTasksToBeDone(@PathVariable(value = "idUser") Long idUser,
                                                                @PathVariable(value = "idPlant") Long idPlant,
                                                                @PathVariable(value = "idTask") Long idTask,
                                                                @RequestParam(value= "bol", required = true) Boolean bool) throws ResourceNotFoundException{
        return ResponseEntity.ok().body(tasksService.updateTaskStatus(idUser, idPlant, idTask, bool));
        
    }
}
