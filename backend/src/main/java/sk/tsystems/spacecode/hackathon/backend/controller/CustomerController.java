package sk.tsystems.spacecode.hackathon.backend.controller;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import sk.tsystems.spacecode.hackathon.backend.model.CustomerDto;
import sk.tsystems.spacecode.hackathon.backend.model.CustomerGroupDto;
import sk.tsystems.spacecode.hackathon.backend.model.RentPreferencesDto;
import sk.tsystems.spacecode.hackathon.backend.model.response.ResponseEntity;
import sk.tsystems.spacecode.hackathon.backend.service.CustomerService;

import java.util.UUID;

@RestController
@RequestMapping("/customer")
@AllArgsConstructor
public class CustomerController {

    private final CustomerService customerService;


    @GetMapping("/{id}")
    public ResponseEntity<CustomerDto> getCustomer(@PathVariable UUID id) {
        return customerService.getCustomer(id);
    }

    @PostMapping
    public ResponseEntity<String> createCustomer(@RequestBody CustomerDto customerDto) {
        return customerService.createCustomer(customerDto);
    }

    @GetMapping("/{id}/preferences")
    public ResponseEntity<RentPreferencesDto> getCustomerPreferences(@PathVariable UUID id) {
        return customerService.getCustomerPreferences(id);
    }

    @PostMapping("/{customerId}/preferences")
    public ResponseEntity<String> createCustomerPreferences(@PathVariable UUID customerId,
                                                            @RequestBody RentPreferencesDto rentPreferencesDto) {
        return customerService.addRentPreferences(customerId, rentPreferencesDto);
    }

    @GetMapping("/{id}/group")
    public ResponseEntity<CustomerGroupDto> findCustomerGroup(@PathVariable UUID id) {
        return customerService.findCustomerGroup(id);
    }

}
