package sk.tsystems.spacecode.hackathon.backend.service;

import sk.tsystems.spacecode.hackathon.backend.model.RentDto;
import sk.tsystems.spacecode.hackathon.backend.model.response.ResponseEntity;

import java.util.List;
import java.util.UUID;

public interface RentService {

    ResponseEntity<List<RentDto>> findAll();

    ResponseEntity<RentDto> getRent(UUID id);

    ResponseEntity<String> createRent(RentDto rentDto);
}
