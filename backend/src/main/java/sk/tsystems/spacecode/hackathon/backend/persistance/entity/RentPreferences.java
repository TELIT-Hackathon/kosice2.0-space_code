package sk.tsystems.spacecode.hackathon.backend.persistance.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RentPreferences {
    @Id
    @GeneratedValue
    private UUID id;
    private String country;
    private String city;
    private Integer maxPrice;
    @ElementCollection
    private List<String> cityParts;
    @OneToOne(fetch = FetchType.EAGER)
    private RoommatePreferences roommatePreferences;
    @OneToOne(fetch = FetchType.EAGER)
    private Education education;
    @OneToOne(fetch = FetchType.EAGER)
    private FreeTime freeTime;
    @OneToOne(fetch = FetchType.EAGER)
    private Transportation transportation;

}
