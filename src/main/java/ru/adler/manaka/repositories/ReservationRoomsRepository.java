package ru.adler.manaka.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.adler.manaka.models.ReservationRooms;

public interface ReservationRoomsRepository extends JpaRepository<ReservationRooms, Long> {
    // Методы для поиска бронирований по дате, номеру и т.д.
}
