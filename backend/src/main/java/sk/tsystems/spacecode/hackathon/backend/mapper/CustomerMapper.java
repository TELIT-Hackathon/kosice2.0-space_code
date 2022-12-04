package sk.tsystems.spacecode.hackathon.backend.mapper;

import org.mapstruct.Builder;
import org.mapstruct.Mapper;
import sk.tsystems.spacecode.hackathon.backend.model.*;
import sk.tsystems.spacecode.hackathon.backend.persistance.entity.*;

@Mapper(componentModel = "spring", builder = @Builder(disableBuilder = true))
public interface CustomerMapper {

    CustomerDto customerToCustomerDto(Customer customer);
    Customer customerDtoToCustomer(CustomerDto customerDto);
    RentPreferencesDto preferencesToPreferencesDto(RentPreferences preferences);
    RentPreferences preferencesDtoToPreferences(RentPreferencesDto preferencesDto);
    RoommatePreferences roommatePreferencesDtoToRoommatePreferences(RoommatePreferencesDto roommatePreferences);

    Education educationDtoToEducation(EducationDto educationDto);
    FreeTime freeTimeDtoToFreeTime(FreeTimeDto freeTimeDto);
    Transportation transportationDtoToTransportation(TransportationDto transportationDto);
}
