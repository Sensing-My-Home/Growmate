package pi.growmate.datamodel.task;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pi.growmate.datamodel.plant.Plant;

import java.sql.Date;


@Entity
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "plant_id")
    private Plant plant;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String description;

    @Column(name = "task_date")
    @Temporal(TemporalType.DATE)
    private Date taskDate;

    @Convert(converter = TaskTypeConverter.class)
    private TaskType taskType;

    @Column(name = "task_done", nullable = false)
    private boolean task_done;

    public void setTaskDone(boolean bol){
        this.task_done = bol;
    }

    public boolean isDone(){
        return task_done;
    }


}