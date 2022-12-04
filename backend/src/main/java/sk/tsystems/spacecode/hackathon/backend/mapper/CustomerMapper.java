package sk.tsystems.spacecode.hackathon.backend.mapper;

import org.mapstruct.Builder;
import org.mapstruct.Mapper;
import sk.tsystems.spacecode.hackathon.backend.model.CustomerDto;
import sk.tsystems.spacecode.hackathon.backend.persistance.entity.Customer;

@Mapper(componentModel = "spring", builder = @Builder(disableBuilder = true))
public interface CustomerMapper {

    CustomerDto customerToCustomerDto(Customer customer);
    Customer customerDtoToCustomer(CustomerDto customer);
}
