package sk.tsystems.spacecode.hackathon.backend.model;

import sk.tsystems.spacecode.hackathon.backend.persistance.entity.Gender;

import java.util.List;
import java.util.UUID;

public record CustomerGroupDto(List<CustomerDto> customers,
                               RentPreferencesDto rentPreferences
                               ) {
}
