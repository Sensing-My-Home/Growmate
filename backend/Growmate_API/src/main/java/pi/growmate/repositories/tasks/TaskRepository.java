package pi.growmate.repositories.tasks;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pi.growmate.datamodel.task.Task;

@Repository
public interface TaskRepository extends JpaRepository<Task, Long>{
    
}