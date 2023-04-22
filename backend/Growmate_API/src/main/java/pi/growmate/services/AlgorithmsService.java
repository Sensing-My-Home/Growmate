package pi.growmate.services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pi.growmate.datamodel.plant.Plant;
import pi.growmate.datamodel.task.TaskType;
import pi.growmate.datamodel.task.Task_Settings;
import pi.growmate.datamodel.task.Tasks_Current;
import pi.growmate.repositories.tasks.CurrentTaskRepository;
import pi.growmate.repositories.tasks.TaskSettingsRepository;

import java.sql.Date;
import java.time.LocalDate;

@Service
@Slf4j
public class AlgorithmsService {

    @Autowired
    TaskSettingsRepository taskSettingsRepository;
    @Autowired
    CurrentTaskRepository currentTaskRepository;

    // TASKS

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
}
