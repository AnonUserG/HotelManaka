package ru.adler.manaka.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.adler.manaka.models.ReservationRooms;
import ru.adler.manaka.repositories.ReservationRoomsRepository;

import java.util.List;

@Service
public class ReservationRoomsService {

    @Autowired
    private ReservationRoomsRepository reservationRoomsRepository;

    public void save(ReservationRooms reservationRooms) {
        reservationRoomsRepository.save(reservationRooms);
    }

    public List<ReservationRooms> findAll() {
        return reservationRoomsRepository.findAll();
    }

    // Другие методы для поиска по дате и номеру
}
