package sk.tsystems.spacecode.hackathon.backend.model;

import sk.tsystems.spacecode.hackathon.backend.persistance.entity.Gender;

import java.util.UUID;

public record CustomerDto(UUID id,
                          String firstName,
                          String lastName,
                          String birthDate,
                          String email,
                          Gender gender,
                          String photo,
                          RentPreferencesDto rentPreferences
) {
}
