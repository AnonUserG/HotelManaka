package ru.adler.manaka.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.adler.manaka.models.Image;
import ru.adler.manaka.models.Room;
import ru.adler.manaka.repositories.ImageRepository;
import ru.adler.manaka.repositories.RoomRepository;

import java.util.List;

@Service
public class RoomService {
    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private ImageRepository imageRepository;

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

    public Image findImageById(Long id) {
        return imageRepository.findById(id).orElse(null);
    }

}
