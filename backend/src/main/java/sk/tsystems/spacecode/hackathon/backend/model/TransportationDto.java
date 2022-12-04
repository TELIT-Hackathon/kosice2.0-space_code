package sk.tsystems.spacecode.hackathon.backend.model;

public record TransportationDto(
        Boolean publicTransport,
        Boolean nonMotor,
        Boolean motor
) {
}
