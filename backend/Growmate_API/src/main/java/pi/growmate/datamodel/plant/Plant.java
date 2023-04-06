package pi.growmate.datamodel.plant;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
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
    @JoinColumn(name ="division_id", nullable = false)
    private Division division;

    @OneToMany(mappedBy = "plant", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<PlantSensor> sensors;

    @OneToMany(mappedBy = "plant", cascade = CascadeType.ALL)
    private List<Comment> commentsOnPlant = new ArrayList<>();

    @OneToMany(mappedBy = "plant", cascade = CascadeType.ALL)
    private List<JournalEntry> journalEntries = new ArrayList<>();

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
}
