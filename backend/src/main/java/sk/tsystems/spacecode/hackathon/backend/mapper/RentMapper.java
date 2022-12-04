package sk.tsystems.spacecode.hackathon.backend.mapper;

import org.mapstruct.Builder;
import org.mapstruct.Mapper;
import sk.tsystems.spacecode.hackathon.backend.model.RentDto;
import sk.tsystems.spacecode.hackathon.backend.persistance.entity.Rent;

@Mapper(componentModel = "spring", builder = @Builder(disableBuilder = true))
public interface RentMapper {

    RentDto rentToRentDto(Rent rent);

    Rent rentDtoToRent(RentDto rentDto);
}
