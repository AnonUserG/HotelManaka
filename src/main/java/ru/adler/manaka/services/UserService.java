package ru.adler.manaka.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.adler.manaka.models.User;
import ru.adler.manaka.models.enums.Role;
import ru.adler.manaka.repositories.UserRepository;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User registerUser(User user) {
        user.setRole(Role.USER);
        user.setIsActive(true);
        return userRepository.save(user);
    }

    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public void deactivateUser(Long id) {
        Optional<User> userOptional = userRepository.findById(id);
        userOptional.ifPresent(user -> {
            user.setIsActive(false);
            userRepository.save(user);
        });
    }

    public void activateUser(Long id) {
        Optional<User> userOptional = userRepository.findById(id);
        userOptional.ifPresent(user -> {
            user.setIsActive(true);
            userRepository.save(user);
        });
    }

}
