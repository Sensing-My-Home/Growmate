package pi.growmate.datamodel.task;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pi.growmate.datamodel.plant.Plant;
import pi.growmate.datamodel.species.OptimalTemperature;
import pi.growmate.datamodel.species.TemperatureConverter;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;


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
}
