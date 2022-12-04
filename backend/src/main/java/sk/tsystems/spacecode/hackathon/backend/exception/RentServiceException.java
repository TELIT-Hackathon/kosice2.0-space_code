package sk.tsystems.spacecode.hackathon.backend.exception;

public class RentServiceException extends RuntimeException {

    private RentServiceException(String message) {
        super(message);
    }

    public static RentServiceException becauseRentNotFound() {
        return new RentServiceException("Rent not found.");
    }
}
