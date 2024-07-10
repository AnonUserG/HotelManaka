package ru.adler.manaka.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.adler.manaka.models.Image;
import ru.adler.manaka.models.Room;
import ru.adler.manaka.models.User;
import ru.adler.manaka.repositories.RoomRepository;

import java.util.List;
import java.util.Optional;

@Service
public class RoomService {
    @Autowired
    private RoomRepository roomRepository;


    public List<Room> findAll() {
        return roomRepository.findAll();
    }

    public void save(Room room) {
        roomRepository.save(room);
    }

    public void deleteById(Long id) {
        roomRepository.deleteById(id);
    }

    public Room findById(Long id) {
        return roomRepository.findById(id).orElse(null);
    }

}
