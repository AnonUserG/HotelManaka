package ru.adler.manaka.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.adler.manaka.models.Image;

public interface ImageRepository extends JpaRepository<Image, Long> {
}
