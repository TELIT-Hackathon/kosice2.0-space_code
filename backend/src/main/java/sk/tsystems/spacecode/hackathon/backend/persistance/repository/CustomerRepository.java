package sk.tsystems.spacecode.hackathon.backend.persistance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import sk.tsystems.spacecode.hackathon.backend.persistance.entity.Customer;

import java.util.UUID;

public interface CustomerRepository extends JpaRepository<Customer, UUID> {

    Customer getCustomerById(UUID id);
}
