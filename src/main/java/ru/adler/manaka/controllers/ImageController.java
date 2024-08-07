package ru.adler.manaka.controllers;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.adler.manaka.models.Image;
import ru.adler.manaka.services.RoomService;


@Controller
public class ImageController {

    @Autowired
    private RoomService roomService;

    @GetMapping("/image/{id}")
    public ResponseEntity<byte[]> getImage(@PathVariable Long id) {
        Image image = roomService.findImageById(id);

        if (image != null) {
            HttpHeaders headers = new HttpHeaders();
            headers.set(HttpHeaders.CONTENT_TYPE, "image/jpeg"); // Предположим, что все изображения в формате JPEG
            return new ResponseEntity<>(image.getBytes(), headers, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}

