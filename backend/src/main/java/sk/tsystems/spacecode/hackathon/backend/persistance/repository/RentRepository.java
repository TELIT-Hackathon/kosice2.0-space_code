package sk.tsystems.spacecode.hackathon.backend.persistance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import sk.tsystems.spacecode.hackathon.backend.persistance.entity.Rent;

import java.util.Optional;
import java.util.UUID;

public interface RentRepository extends JpaRepository<Rent, UUID> {

    Optional<Rent> getRentById(UUID id);

}
