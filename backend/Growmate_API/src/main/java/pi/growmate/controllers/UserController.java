package pi.growmate.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import pi.growmate.datamodel.user.User;
import pi.growmate.exceptions.ResourceNotFoundException;
import pi.growmate.services.UserService;


@RestController
@RequestMapping("growmate/user")
@CrossOrigin
public class UserController {

    @Autowired
    private UserService userService;

    // get informacoes do utilizador
    @GetMapping("/{idUser}")
    public ResponseEntity<User> getUserInfo(@PathVariable(value = "idUser") Long idUser) throws ResourceNotFoundException{
        return ResponseEntity.ok().body(userService.getUser(idUser));
    }

    
}
