package com.example.demo.controller;

import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String databaseOperations() {
        return "databaseoperations";
    }

    @GetMapping("/insert")
    public String insertUser(@RequestParam String name, @RequestParam String email) {
        userService.addUser(name, email);
        return "redirect:/"; // Redirect back to the operations page
    }

    @GetMapping("/retrieve")
    public String retrieveUsers(Model model) {
        model.addAttribute("users", userService.getUsers());
        return "databaseoperations";
    }
}