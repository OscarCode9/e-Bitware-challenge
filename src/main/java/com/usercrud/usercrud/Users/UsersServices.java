package com.usercrud.usercrud.Users;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UsersServices {

    private final UsersRepo usersRepo;
    private final UsersMapper usersMapper;

    public UsersServices(UsersRepo usersRepo, UsersMapper usersMapper) {
        this.usersRepo = usersRepo;
        this.usersMapper = usersMapper;
    }

    public UsersDto create(UsersEntity user) {
        var savedUser = usersRepo.save(user);
        return usersMapper.toDto(savedUser);
    }

    public List<UsersDto> getAll() {
        return usersRepo
                .findAll()
                .stream()
                .map(usersMapper::toDto).collect(Collectors.toList());
    }

    public UsersDto getById(Integer id) {
        var user = usersRepo.findById(id).orElseThrow();
        return usersMapper.toDto(user);
    }

    public UsersDto update(Integer id, UsersEntity updatedUser) {
        var user = usersRepo.findById(id).orElseThrow();
        user.setFirstName(updatedUser.getFirstName());
        user.setLastName(updatedUser.getLastName());
        user.setEmail(updatedUser.getEmail());
        user.setAge(updatedUser.getAge());
        var savedUser = usersRepo.save(user);
        return usersMapper.toDto(savedUser);
    }

    public void delete(Integer id) {
        usersRepo.deleteById(id);
    }
}
