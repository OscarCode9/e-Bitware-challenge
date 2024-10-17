package com.usercrud.usercrud.Users;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class UsersController  {
    private final UsersServices usersServices;

    public UsersController(UsersServices usersServices) {
        this.usersServices = usersServices;
    }

    @GetMapping("/users")
    public List<UsersDto> getUsers() {
        return usersServices.getAll();
    }

    @PostMapping("/users")
    public UsersDto createUser(
            @RequestBody UsersEntity user
    ) {
        return usersServices.create(user);
    }

    @GetMapping("/users/{id}")
    public UsersDto getUserById(
            @PathVariable Integer id
    ) {
        return usersServices.getById(id);
    }

    @PutMapping("/users/{id}")
    public UsersDto updateUser(
            @PathVariable Integer id,
            @RequestBody UsersEntity updatedUser
    ) {
        return usersServices.update(id, updatedUser);
    }
    @DeleteMapping("/users/{id}")
    public void deleteUser(
            @PathVariable Integer id
    ) {
        usersServices.delete(id);
    }
}
