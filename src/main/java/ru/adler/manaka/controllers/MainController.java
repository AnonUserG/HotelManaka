package ru.adler.manaka.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.adler.manaka.models.Room;
import ru.adler.manaka.models.User;
import ru.adler.manaka.services.RoomService;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private RoomService roomService;

    @Value("${telegram.url}")
    private String telegramUrl;

    @Value("${whatsapp.url}")
    private String whatsappUrl;

    @GetMapping("/")
    public String showLandingPage(@RequestParam(value = "startDate", required = false) String startDate,
                                  @RequestParam(value = "endDate", required = false) String endDate,
                                  Model model, HttpSession session) {
        List<Room> rooms;

        if (startDate != null && endDate != null) {
            // Парсинг строковых значений дат в объекты LocalDate
            LocalDate start = LocalDate.parse(startDate);
            LocalDate end = LocalDate.parse(endDate);
            // Получение списка доступных номеров на указанные даты
            rooms = roomService.findAvailableRooms(start, end);
        } else {
            // Если даты не указаны, получить все номера
            rooms = roomService.findAll();
        }

        // Добавление списка номеров в модель
        model.addAttribute("rooms", rooms);

        // Получение информации о пользователе, если он вошел в систему
        Object loggedInUser = session.getAttribute("loggedInUser");
        model.addAttribute("loggedInUser", loggedInUser);

        // Проверка, является ли пользователь администратором
        boolean isAdmin = loggedInUser != null && "ADMIN".equals(((User) loggedInUser).getRole().name());
        model.addAttribute("isAdmin", isAdmin);

        // Передаем URL мессенджеров в модель
        model.addAttribute("telegramUrl", telegramUrl);
        model.addAttribute("whatsappUrl", whatsappUrl);

        return "index";
    }
}

