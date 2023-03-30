package pi.growmate.datamodel.division;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pi.growmate.datamodel.division.Division;
import pi.growmate.datamodel.user.User;

@Entity
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DivisionSensor {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="user_id", nullable = false)
    private User owner;

    @Column(nullable = false)
    private String name;

    @Column(name = "sensor_code", nullable = false)
    private String sensorCode;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "division_id", referencedColumnName = "id")
    private Division division;
}
