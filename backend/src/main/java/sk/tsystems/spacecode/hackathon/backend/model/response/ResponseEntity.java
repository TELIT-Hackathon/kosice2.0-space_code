package sk.tsystems.spacecode.hackathon.backend.model.response;


public record ResponseEntity<T> (T content, ResponseCode statusMessage) {

}
