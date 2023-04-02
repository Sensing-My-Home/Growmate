package pi.growmate.datamodel.measurements;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pi.growmate.datamodel.division.DivisionSensor;

import java.time.LocalDateTime;

@Entity
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AirQualityMeasurement {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="sensor_id", nullable = false)
    private DivisionSensor sensor;

    @Column
    private Double measurement;

    @Column(columnDefinition = "TIMESTAMP")
    private LocalDateTime postDate;
}
