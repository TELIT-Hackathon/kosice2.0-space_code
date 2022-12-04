package sk.tsystems.spacecode.hackathon.backend.persistance.entity;

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
public class Transportation {
    @Id
    @GeneratedValue
    private UUID id;
    private Boolean publicTransport;
    private Boolean nonMotor;
    private Boolean motor;

}
