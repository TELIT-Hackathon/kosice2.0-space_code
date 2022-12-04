package sk.tsystems.spacecode.hackathon.backend.mapper;

import org.mapstruct.Builder;
import org.mapstruct.Mapper;
import sk.tsystems.spacecode.hackathon.backend.model.response.ResponseCode;
import sk.tsystems.spacecode.hackathon.backend.model.response.ResponseEntity;

import java.util.List;

@Mapper(componentModel = "spring", builder = @Builder(disableBuilder = true))
public interface ResponseMapper {

    default <T> ResponseEntity<T> mapToSuccessfulResponse(T dto) {
        return new ResponseEntity<>(dto, ResponseCode.SUCCESSFUL);
    }
}
