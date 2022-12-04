package sk.tsystems.spacecode.hackathon.backend.model;

import sk.tsystems.spacecode.hackathon.backend.persistance.entity.Gender;
import sk.tsystems.spacecode.hackathon.backend.persistance.entity.Nationality;

import java.util.UUID;

public record RoommatePreferencesDto(UUID id,
                                     String ageFrom,
                                     String ageTo,
                                     Nationality nationality,
                                     Gender gender
                                     ) {
}
