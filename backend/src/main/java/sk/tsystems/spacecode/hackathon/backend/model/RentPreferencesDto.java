package sk.tsystems.spacecode.hackathon.backend.model;


import java.util.List;
import java.util.UUID;

public record RentPreferencesDto(UUID id,
                                 String country,
                                 String city,
                                 List<String> cityParts,
                                 Integer maxPrice,
                                 RoommatePreferencesDto roommatePreferences,
                                 EducationDto education,
                                 FreeTimeDto freeTime,
                                 TransportationDto transportation
) {
}
