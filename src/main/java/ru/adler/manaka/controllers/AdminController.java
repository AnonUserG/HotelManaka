package ru.adler.manaka.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
        model.addAttribute("users", userService.findAll());
        return "admin";
    }

    @PostMapping("/admin/addRoom")
    public String addRoom(@ModelAttribute Room room) {
        roomService.save(room);
        return "redirect:/";
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

}
