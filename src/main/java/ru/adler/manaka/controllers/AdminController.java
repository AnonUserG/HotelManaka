package ru.adler.manaka.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import ru.adler.manaka.models.Room;
import ru.adler.manaka.services.RoomService;
import ru.adler.manaka.services.UserService;


@Controller
public class AdminController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private UserService userService;

    @GetMapping("/admin")
    public String showAdminPanel(Model model) {
        model.addAttribute("room", new Room());
        return "admin";
    }

    @GetMapping("/admin/users")
    public String showListUsers(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "admin-list-users";
    }

    @PostMapping("/admin/addRoom")
    public String addRoom(@ModelAttribute Room room) {
        roomService.save(room);
        return "redirect:/";
    }

}
