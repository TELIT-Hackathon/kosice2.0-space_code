package sk.tsystems.spacecode.hackathon.backend.service;

import io.minio.GetPresignedObjectUrlArgs;
import io.minio.MinioClient;
import io.minio.errors.*;
import io.minio.http.Method;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import sk.tsystems.spacecode.hackathon.backend.exception.RentServiceException;
import sk.tsystems.spacecode.hackathon.backend.mapper.RentMapper;
import sk.tsystems.spacecode.hackathon.backend.mapper.ResponseMapper;
import sk.tsystems.spacecode.hackathon.backend.model.RentDto;
import sk.tsystems.spacecode.hackathon.backend.model.response.ResponseEntity;
import sk.tsystems.spacecode.hackathon.backend.persistance.entity.Rent;
import sk.tsystems.spacecode.hackathon.backend.persistance.repository.RentRepository;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Service
@Slf4j
public class RentServiceImpl implements RentService {

    private final RentRepository rentRepository;
    private final RentMapper rentMapper;
    private final ResponseMapper responseMapper;
    private final MinioClient minioClient;
    @Value("${minio.bucketName}")
    private String minioBucket;

    public RentServiceImpl(RentRepository rentRepository, RentMapper rentMapper, ResponseMapper responseMapper, MinioClient minioClient) {
        this.rentRepository = rentRepository;
        this.rentMapper = rentMapper;
        this.responseMapper = responseMapper;
        this.minioClient = minioClient;
    }

    public ResponseEntity<List<RentDto>> findAll() {
        var rents = rentRepository.findAll(Sort.by(Sort.Direction.ASC, "pricePerPerson"));
        var rentsDto = rents.stream().map(this::assignPhotoLink).map(rentMapper::rentToRentDto).toList();
        return responseMapper.mapToSuccessfulResponse(rentsDto);
    }

    public ResponseEntity<RentDto> getRent(UUID id) {
        var rent =  rentRepository.getRentById(id).orElseThrow(RentServiceException::becauseRentNotFound);
        var rentDto = rentMapper.rentToRentDto(assignPhotoLink(rent));
        return responseMapper.mapToSuccessfulResponse(rentDto);
    }

    public ResponseEntity<String> createRent(RentDto rentDto) {
        var rent = rentMapper.rentDtoToRent(rentDto);
        rent = rentRepository.save(rent);
        return responseMapper.mapToSuccessfulResponse(rent.getId().toString());
    }

    private Rent assignPhotoLink(Rent rent) {
        if (!rent.getPhoto().contains("https://lh3.googleusercontent.com")) {
            try {
                var url = minioClient.getPresignedObjectUrl(
                        GetPresignedObjectUrlArgs.builder()
                                .method(Method.GET)
                                .bucket(minioBucket)
                                .object(rent.getPhoto())
                                .expiry(7, TimeUnit.DAYS)
                                .build());

                log.info(url);
                rent.setPhoto(url);
            } catch (ErrorResponseException | InsufficientDataException | io.minio.errors.InternalException |
                      InvalidKeyException | InvalidResponseException | IOException |
                     NoSuchAlgorithmException | XmlParserException | ServerException ignored) {
                log.error("Error while generating s3 bucket links.");
            }
        }
        return rent;
    }
}
