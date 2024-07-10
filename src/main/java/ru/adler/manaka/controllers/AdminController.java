package ru.adler.manaka.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.adler.manaka.models.Image;
import ru.adler.manaka.models.Room;
import ru.adler.manaka.services.RoomService;
import ru.adler.manaka.services.UserService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@Controller
public class AdminController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private UserService userService;

    @GetMapping("/admin")
    public String showAdminPanel(Model model) {
        model.addAttribute("room", new Room());
        model.addAttribute("users", userService.findAll());
        model.addAttribute("rooms", roomService.findAll());
        return "admin";
    }

    @PostMapping("/admin/addRoom")
    public String addRoom(@ModelAttribute Room room,
                          @RequestParam("file1") MultipartFile mainImage,
                          @RequestParam("file2") MultipartFile image1,
                          @RequestParam("file3") MultipartFile image2,
                          @RequestParam("file4") MultipartFile image3) throws IOException {
        List<Image> imageList = new ArrayList<>();

        if (!mainImage.isEmpty()) {
            Image mainImg = new Image();
            mainImg.setBytes(mainImage.getBytes());
            mainImg.setRoom(room);
            imageList.add(mainImg);
        }

        if (!image1.isEmpty()) {
            Image img1 = new Image();
            img1.setBytes(image1.getBytes());
            img1.setRoom(room);
            imageList.add(img1);
        }

        if (!image2.isEmpty()) {
            Image img2 = new Image();
            img2.setBytes(image2.getBytes());
            img2.setRoom(room);
            imageList.add(img2);
        }

        if (!image3.isEmpty()) {
            Image img3 = new Image();
            img3.setBytes(image3.getBytes());
            img3.setRoom(room);
            imageList.add(img3);
        }

        room.setImages(imageList);
        roomService.save(room);
        return "redirect:/admin";
    }

    @GetMapping("/admin/deactivateUser/{id}")
    public String deactivateUser(@PathVariable Long id) {
        userService.deactivateUser(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/activateUser/{id}")
    public String activateUser(@PathVariable Long id) {
        userService.activateUser(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/deleteRoom/{id}")
    public String deleteRoom(@PathVariable Long id) {
        roomService.deleteById(id);
        return "redirect:/admin";
    }

}
