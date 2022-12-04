package sk.tsystems.spacecode.hackathon.backend.persistance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import sk.tsystems.spacecode.hackathon.backend.persistance.entity.RentPreferences;
import sk.tsystems.spacecode.hackathon.backend.persistance.entity.RoommatePreferences;

import java.util.UUID;

public interface RoommatePreferencesRepository extends JpaRepository<RoommatePreferences, UUID> {
}
