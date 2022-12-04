package sk.tsystems.spacecode.hackathon.backend.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import sk.tsystems.spacecode.hackathon.backend.mapper.CustomerMapper;
import sk.tsystems.spacecode.hackathon.backend.mapper.ResponseMapper;
import sk.tsystems.spacecode.hackathon.backend.model.CustomerDto;
import sk.tsystems.spacecode.hackathon.backend.model.response.ResponseEntity;
import sk.tsystems.spacecode.hackathon.backend.persistance.repository.CustomerRepository;

import java.util.UUID;

@Service
@AllArgsConstructor
public class CustomerServiceImpl implements CustomerService {

    private final CustomerRepository customerRepository;
    private final CustomerMapper customerMapper;
    private final ResponseMapper responseMapper;

    public ResponseEntity<CustomerDto> getCustomer(UUID id) {
        var customer = customerRepository.getCustomerById(id);
        var customerDto = customerMapper.customerToCustomerDto(customer);
        return responseMapper.mapToSuccessfulResponse(customerDto);
    }

    @Override
    public ResponseEntity<String> createCustomer(CustomerDto customerDto) {
        var customer = customerMapper.customerDtoToCustomer(customerDto);
        customer = customerRepository.save(customer);
        return responseMapper.mapToSuccessfulResponse(customer.getId().toString());
    }


}
