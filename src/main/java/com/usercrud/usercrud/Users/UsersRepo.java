package com.usercrud.usercrud.Users;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UsersRepo extends JpaRepository<UsersEntity, Integer> {
}
