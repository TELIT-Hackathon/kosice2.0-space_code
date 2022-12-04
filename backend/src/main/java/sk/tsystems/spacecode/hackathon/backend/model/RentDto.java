package sk.tsystems.spacecode.hackathon.backend.model;

import java.util.UUID;

public record RentDto(UUID id,
                      String name,
                      String description,
                      String rentType,
                      String country,
                      String city,
                      String cityPart,
                      String street,
                      String houseNumber,
                      Float latitude,
                      Float longitude,
                      Float pricePerPerson,
                      Float pricePerArea,
                      String rentState,
                      Float squaredMeters,
                      Integer numberOfRooms,
                      Integer numberOfOccupants,
                      String photo

) {
}
