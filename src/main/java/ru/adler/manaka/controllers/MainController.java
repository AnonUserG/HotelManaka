package ru.adler.manaka.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.adler.manaka.models.User;
import ru.adler.manaka.services.RoomService;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    @Autowired
    private RoomService roomService;

    @GetMapping("/")
    public String showLandingPage(Model model, HttpSession session) {
        model.addAttribute("rooms", roomService.findAll());
        Object loggedInUser = session.getAttribute("loggedInUser");
        model.addAttribute("loggedInUser", loggedInUser);

        boolean isAdmin = loggedInUser != null && "ADMIN".equals(((User) loggedInUser).getRole().name());
        model.addAttribute("isAdmin", isAdmin);
        return "index";
    }

}
