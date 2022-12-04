package sk.tsystems.spacecode.hackathon.backend.persistance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import sk.tsystems.spacecode.hackathon.backend.persistance.entity.FreeTime;
import sk.tsystems.spacecode.hackathon.backend.persistance.entity.Transportation;

import java.util.UUID;

public interface FreeTimeRepository extends JpaRepository<FreeTime, UUID> {

}
