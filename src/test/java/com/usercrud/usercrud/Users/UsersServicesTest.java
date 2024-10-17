package com.usercrud.usercrud.Users;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

class UsersServicesTest {

    @Mock
    private UsersRepo usersRepo;

    @Mock
    private UsersMapper usersMapper;

    @InjectMocks
    private UsersServices usersServices;

    private UsersEntity userEntity;
    private UsersDto userDto;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);

        // Setup mock UsersEntity and UsersDto
        userEntity = new UsersEntity();
        userEntity.setId(1);
        userEntity.setFirstName("John");
        userEntity.setLastName("Doe");
        userEntity.setEmail("john.doe@example.com");
        userEntity.setAge(30);

        userDto = new UsersDto();
        userDto.setFirstName("John");
        userDto.setLastName("Doe");
        userDto.setEmail("john.doe@example.com");
        userDto.setAge(30);
    }

    @Test
    void testCreate() {
        // Arrange
        Mockito.when(usersRepo.save(Mockito.any(UsersEntity.class))).thenReturn(userEntity);
        Mockito.when(usersMapper.toDto(Mockito.any(UsersEntity.class))).thenReturn(userDto);

        // Act
        UsersDto result = usersServices.create(userEntity);

        // Assert
        assertNotNull(result);
        assertEquals("John", result.getFirstName());
        Mockito.verify(usersRepo, Mockito.times(1)).save(userEntity);
        Mockito.verify(usersMapper, Mockito.times(1)).toDto(userEntity);
    }

    @Test
    void testGetAll() {
        // Arrange
        Mockito.when(usersRepo.findAll()).thenReturn(List.of(userEntity));
        Mockito.when(usersMapper.toDto(Mockito.any(UsersEntity.class))).thenReturn(userDto);

        // Act
        List<UsersDto> result = usersServices.getAll();

        // Assert
        assertNotNull(result);
        assertEquals(1, result.size());
        assertEquals("John", result.get(0).getFirstName());
        Mockito.verify(usersRepo, Mockito.times(1)).findAll();
        Mockito.verify(usersMapper, Mockito.times(1)).toDto(userEntity);
    }

    @Test
    void testGetById() {
        // Arrange
        Mockito.when(usersRepo.findById(Mockito.anyInt())).thenReturn(Optional.of(userEntity));
        Mockito.when(usersMapper.toDto(Mockito.any(UsersEntity.class))).thenReturn(userDto);

        // Act
        UsersDto result = usersServices.getById(1);

        // Assert
        assertNotNull(result);
        assertEquals("John", result.getFirstName());
        Mockito.verify(usersRepo, Mockito.times(1)).findById(1);
        Mockito.verify(usersMapper, Mockito.times(1)).toDto(userEntity);
    }

    @Test
    void testUpdate() {
        // Arrange
        UsersEntity updatedUser = new UsersEntity();
        updatedUser.setFirstName("Jane");
        updatedUser.setLastName("Doe");
        updatedUser.setEmail("jane.doe@example.com");
        updatedUser.setAge(28);

        Mockito.when(usersRepo.findById(Mockito.anyInt())).thenReturn(Optional.of(userEntity));
        Mockito.when(usersRepo.save(Mockito.any(UsersEntity.class))).thenReturn(updatedUser);
        Mockito.when(usersMapper.toDto(Mockito.any(UsersEntity.class))).thenReturn(userDto);

        // Act
        UsersDto result = usersServices.update(1, updatedUser);

        // Assert
        assertNotNull(result);
        Mockito.verify(usersRepo, Mockito.times(1)).findById(1);
        Mockito.verify(usersRepo, Mockito.times(1)).save(userEntity);
        Mockito.verify(usersMapper, Mockito.times(1)).toDto(updatedUser);
    }

    @Test
    void testDelete() {
        // Act
        usersServices.delete(1);

        // Assert
        Mockito.verify(usersRepo, Mockito.times(1)).deleteById(1);
    }
}