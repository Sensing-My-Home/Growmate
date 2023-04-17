package pi.growmate.repositories.tasks;

import org.springframework.data.jpa.repository.JpaRepository;
import pi.growmate.datamodel.task.Task_Settings;

public interface TaskSettingsRepository extends JpaRepository<Task_Settings, Long> {

}
