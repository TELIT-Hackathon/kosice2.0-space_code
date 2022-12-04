package sk.tsystems.spacecode.hackathon.backend.persistance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import sk.tsystems.spacecode.hackathon.backend.persistance.entity.RentPreferences;

import java.util.UUID;

public interface RentPreferencesRepository extends JpaRepository<RentPreferences, UUID> {
}
