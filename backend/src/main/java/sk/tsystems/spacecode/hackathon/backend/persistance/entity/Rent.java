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
    private String name;
    @Column(length=Integer.MAX_VALUE)
    private String description;
    private String rentType;
    private String city;
    private String cityPart;
    private String street;
    private String houseNumber;
    private Float latitude;
    private Float longitude;
    private Float pricePerPerson;
    private Float pricePerArea;
    private String rentState;
    private Float squaredMeters;
    private Integer numberOfRooms;
    private Integer numberOfOccupants;
    private String photo;
    private Float school;
    private Float culture;
    private Float green;
    private Float health;
}
