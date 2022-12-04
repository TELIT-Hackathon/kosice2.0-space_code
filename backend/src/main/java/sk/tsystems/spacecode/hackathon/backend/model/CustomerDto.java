package sk.tsystems.spacecode.hackathon.backend.model;

public record CustomerDto(String firstName,
                          String lastName,
                          String BirthDate,
                          String email
) {
}
