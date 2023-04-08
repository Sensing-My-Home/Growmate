package pi.growmate.datamodel.plant;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import pi.growmate.datamodel.division.Division;
import pi.growmate.datamodel.forum.Comment;
import pi.growmate.datamodel.forum.JournalEntry;
import pi.growmate.datamodel.species.PlantSpecies;
import pi.growmate.datamodel.task.Task;
import pi.growmate.datamodel.user.User;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Plant {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(name = "photo")
    private String plantPhoto;

    @Column(name = "plantation_Date")
    @Temporal(TemporalType.DATE)
    private Date plantationDate;

    @Convert(converter = PlantConditionConverter.class)
    private PlantCondition plantCondition;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="user_id", nullable = false)
    private User owner;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="species_id", nullable = false)
    private PlantSpecies species;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="division_id")
    private Division division;

    @JsonIgnore
    @OneToMany(mappedBy = "plant", cascade = CascadeType.ALL)
    private List<PlantSensor> sensors = new ArrayList<>();

    @JsonIgnore
    @OneToMany(mappedBy = "plant", cascade = CascadeType.ALL)
    private List<Comment> commentsOnPlant = new ArrayList<>();

    @JsonIgnore
    @OneToMany(mappedBy = "plant", cascade = CascadeType.ALL)
    private List<JournalEntry> journalEntries = new ArrayList<>();

    @JsonIgnore
    @OneToMany(mappedBy = "plant", cascade = CascadeType.ALL)
    private List<Task> plantTasks = new ArrayList<>();

    // Getter methods that need to be ignored on JSON replies
    @JsonIgnore
    public List<Comment> getCommentsOnPlant() {
        return commentsOnPlant;
    }

    @JsonIgnore
    public void setJournalEntries(List<JournalEntry> journalEntries) {
        this.journalEntries = journalEntries;
    }

    @JsonIgnore
    public List<Task> getPlantTasks() {
        return plantTasks;
    }

    @JsonIgnore
    public List<PlantSensor> getSensors() {
        return sensors;
    }

    @JsonIgnore
    public void addSensor(PlantSensor sensor){
        this.sensors.add(sensor);
    }

    @JsonIgnore
    public void removeSensor(PlantSensor sensor){
        this.sensors.removeIf(psensor -> psensor.getId().equals(sensor.getId()));
    }

    @JsonIgnore
    public void removeAllSensors(){
        this.sensors.clear();
    }
}
