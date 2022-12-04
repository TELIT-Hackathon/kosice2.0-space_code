package sk.tsystems.spacecode.hackathon.backend.persistance.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;
    private String firstName;
    private String lastName;
    private String birthDate;
    private String email;
    private Gender gender;
    private String photo;
    @OneToOne(fetch = FetchType.LAZY)
    private RentPreferences rentPreferences;

}
