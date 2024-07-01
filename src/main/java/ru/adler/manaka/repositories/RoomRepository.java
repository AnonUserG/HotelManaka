package ru.adler.manaka.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.adler.manaka.models.Room;

public interface RoomRepository extends JpaRepository<Room, Long> {
}