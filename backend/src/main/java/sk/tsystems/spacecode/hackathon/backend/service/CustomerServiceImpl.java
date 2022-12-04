package sk.tsystems.spacecode.hackathon.backend.service;

import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import sk.tsystems.spacecode.hackathon.backend.mapper.CustomerMapper;
import sk.tsystems.spacecode.hackathon.backend.mapper.ResponseMapper;
import sk.tsystems.spacecode.hackathon.backend.model.CustomerDto;
import sk.tsystems.spacecode.hackathon.backend.model.RentPreferencesDto;
import sk.tsystems.spacecode.hackathon.backend.model.response.ResponseEntity;
import sk.tsystems.spacecode.hackathon.backend.persistance.repository.*;

import java.util.UUID;

@Service
@AllArgsConstructor
@Slf4j
public class CustomerServiceImpl implements CustomerService {

    private final CustomerRepository customerRepository;
    private final CustomerMapper customerMapper;
    private final ResponseMapper responseMapper;
    private final RentPreferencesRepository rentPreferencesRepository;
    private final RoommatePreferencesRepository roommatePreferencesRepository;
    private final EducationRepository educationRepository;
    private final TransportationRepository transportationRepository;
    private final FreeTimeRepository freeTimeRepository;

    public ResponseEntity<CustomerDto> getCustomer(UUID id) {
        var customer = customerRepository.getCustomerById(id);
        var customerDto = customerMapper.customerToCustomerDto(customer);
        return responseMapper.mapToSuccessfulResponse(customerDto);
    }

    public ResponseEntity<String> createCustomer(CustomerDto customerDto) {
        var customer = customerMapper.customerDtoToCustomer(customerDto);
        customer = customerRepository.save(customer);
        return responseMapper.mapToSuccessfulResponse(customer.getId().toString());
    }

    @Transactional
    public ResponseEntity<RentPreferencesDto> getCustomerPreferences(UUID id) {
        var customer = customerRepository.getCustomerById(id);
        var preferences = customer.getRentPreferences();
        var preferencesDto = customerMapper.preferencesToPreferencesDto(preferences);
        return responseMapper.mapToSuccessfulResponse(preferencesDto);
    }

    @Transactional
    public ResponseEntity<String> addRentPreferences(UUID customerId, RentPreferencesDto rentPreferencesDto) {
        var customer = customerRepository.getCustomerById(customerId);
        var preferences = customerMapper.preferencesDtoToPreferences(rentPreferencesDto);
        var education = customerMapper.educationDtoToEducation(rentPreferencesDto.education());
        var transportation = customerMapper.transportationDtoToTransportation(rentPreferencesDto.transportation());
        var freeTime = customerMapper.freeTimeDtoToFreeTime(rentPreferencesDto.freeTime());

        if (education != null) {
            log.info(String.format("Saving education %s", education));
            education = educationRepository.save(education);
        }

        if(transportation != null){
            log.info(String.format("Saving transportation %s", transportation));
            transportation = transportationRepository.save(transportation);
        }

        if (freeTime != null){
            log.info(String.format("Saving freeTime %s", freeTime));
            freeTime = freeTimeRepository.save(freeTime);
        }

        var roommatePreferences = customerMapper.roommatePreferencesDtoToRoommatePreferences(rentPreferencesDto.roommatePreferences());
        if (roommatePreferences != null) {
            log.info(String.format("Saving roommatePreferences %s", roommatePreferences));
            roommatePreferences = roommatePreferencesRepository.save(roommatePreferences);
        }
        preferences.setRoommatePreferences(roommatePreferences);
        preferences.setTransportation(transportation);
        preferences.setFreeTime(freeTime);
        preferences.setEducation(education);
        preferences = rentPreferencesRepository.save(preferences);
        customer.setRentPreferences(preferences);
        customer = customerRepository.save(customer);
        return responseMapper.mapToSuccessfulResponse(customer.getRentPreferences().getId().toString());
    }


}
