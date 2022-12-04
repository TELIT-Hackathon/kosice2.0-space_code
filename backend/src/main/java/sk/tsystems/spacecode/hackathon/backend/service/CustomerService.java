package sk.tsystems.spacecode.hackathon.backend.service;

import sk.tsystems.spacecode.hackathon.backend.model.CustomerDto;
import sk.tsystems.spacecode.hackathon.backend.model.RentPreferencesDto;
import sk.tsystems.spacecode.hackathon.backend.model.response.ResponseEntity;

import java.util.UUID;

public interface CustomerService {

    ResponseEntity<CustomerDto> getCustomer(UUID id);

    ResponseEntity<String> createCustomer(CustomerDto customerDto);

    ResponseEntity<RentPreferencesDto> getCustomerPreferences(UUID id);

    ResponseEntity<String> addRentPreferences(UUID id, RentPreferencesDto rentPreferencesDto);
}
