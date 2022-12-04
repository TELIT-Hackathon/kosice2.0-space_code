package sk.tsystems.spacecode.hackathon.backend.controller;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import sk.tsystems.spacecode.hackathon.backend.model.RentDto;
import sk.tsystems.spacecode.hackathon.backend.model.response.ResponseEntity;
import sk.tsystems.spacecode.hackathon.backend.service.RentService;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/rent")
@AllArgsConstructor
public class RentController {

    private final RentService rentService;

    @GetMapping("/all")
    public ResponseEntity<List<RentDto>> getAll(){
        return rentService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<RentDto> getRent(@PathVariable UUID id) {
        return rentService.getRent(id);
    }

    @PostMapping
    public ResponseEntity<String> createRent(@RequestBody RentDto rent){
        return rentService.createRent(rent);
    }
}
