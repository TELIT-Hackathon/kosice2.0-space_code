package sk.tsystems.spacecode.hackathon.backend.persistance.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
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
public class Rent {
    @Id
    @GeneratedValue
    private UUID id;
    @Column(length=Integer.MAX_VALUE)
    String name;
    @Column(length=Integer.MAX_VALUE)
    String description;
    String rentType;
    String city;
    String cityPart;
    String street;
    String houseNumber;
    Float latitude;
    Float longitude;
    Float pricePerPerson;
    Float pricePerArea;
    String rentState;
    Float squaredMeters;
    Integer numberOfRooms;
    Integer numberOfOccupants;
    String photo;

}
