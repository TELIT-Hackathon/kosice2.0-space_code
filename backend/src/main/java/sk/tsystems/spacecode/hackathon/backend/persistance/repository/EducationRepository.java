package sk.tsystems.spacecode.hackathon.backend.persistance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import sk.tsystems.spacecode.hackathon.backend.persistance.entity.Education;

import java.util.UUID;

public interface EducationRepository extends JpaRepository<Education, UUID> {

}
