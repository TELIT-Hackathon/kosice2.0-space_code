package sk.tsystems.spacecode.hackathon.backend.controller;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import sk.tsystems.spacecode.hackathon.backend.model.CustomerDto;
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
}
