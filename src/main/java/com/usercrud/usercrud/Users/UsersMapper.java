package com.usercrud.usercrud.Users;

import org.springframework.stereotype.Service;

@Service
public class UsersMapper {
    public UsersEntity toEntity(UsersDto dto) {
        var user = new UsersEntity();
        user.setFirstName(dto.getFirstName());
        user.setLastName(dto.getLastName());
        user.setEmail(dto.getEmail());
        user.setAge(dto.getAge());
        return user;
    }
    public UsersDto toDto(UsersEntity entity) {
        var user = new UsersDto();
        user.setFirstName(entity.getFirstName());
        user.setLastName(entity.getLastName());
        user.setEmail(entity.getEmail());
        user.setAge(entity.getAge());
        return user;
    }
}
