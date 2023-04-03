package pi.growmate.datamodel.division;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.*;
import pi.growmate.datamodel.plant.Plant;
import pi.growmate.datamodel.species.LuminosityConverter;
import pi.growmate.datamodel.species.OptimalLuminosity;
import pi.growmate.datamodel.user.User;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class Division {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @JsonIgnore
    @JsonIgnoreProperties("division")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User owner;

    @Column(nullable = false)
    private String name;

    @Convert(converter = LuminosityConverter.class)
    private OptimalLuminosity luminosity;

    @OneToMany(mappedBy = "division", cascade = CascadeType.ALL)
    private List<Plant> plantsOnDivision = new ArrayList<>();

    @OneToOne(mappedBy = "division")
    private DivisionSensor sensor;

    // Getter methods that need to be ignored on JSON replies
    @JsonIgnore
    public List<Plant> getPlantsOnDivision() {
        return plantsOnDivision;
    }
    @JsonIgnore
    public DivisionSensor getSensor() {
        return sensor;
    }
}
