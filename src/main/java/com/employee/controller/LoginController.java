package com.employee.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.employee.model.User;
import com.employee.service.UserService;
import com.employee.service.UserServiceImpl;

@Controller
@RequestMapping("/login")
public class LoginController {

    private UserService userService;

    public LoginController() {
        userService = new UserServiceImpl();
    }

    @GetMapping
    public String showLoginPage() {
        return "login";
    }

    @PostMapping
    public String login(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("role") String role,
            HttpSession session,
            Model model) {

        System.out.println("=================================");
        System.out.println("LOGIN REQUEST RECEIVED");
        System.out.println("Email: " + email);
        System.out.println("Role: " + role);
        System.out.println("=================================");

        User user = userService.authenticate(
                email.trim(),
                password
        );

        if (user == null) {

            System.out.println("LOGIN FAILED - INVALID EMAIL OR PASSWORD");

            model.addAttribute(
                    "error",
                    "Invalid email or password."
            );

            return "login";
        }

        System.out.println("LOGIN SUCCESS");
        System.out.println("Username: " + user.getUsername());
        System.out.println("Role: " + user.getRole());
        System.out.println("Employee ID: " + user.getEmployeeId());

        if (!role.equalsIgnoreCase(user.getRole())) {

            System.out.println("LOGIN FAILED - ROLE DOES NOT MATCH");

            model.addAttribute(
                    "error",
                    "Selected role does not match your account."
            );

            return "login";
        }

        session.setAttribute("userId", user.getId());
        session.setAttribute("username", user.getUsername());
        session.setAttribute("role", user.getRole());
        session.setAttribute("employeeId", user.getEmployeeId());

        if ("ADMIN".equalsIgnoreCase(user.getRole())) {
            return "redirect:/admin";
        }

        if ("MANAGER".equalsIgnoreCase(user.getRole())) {
            return "redirect:/manager";
        }

        if ("EMPLOYEE".equalsIgnoreCase(user.getRole())) {

            if (user.getEmployeeId() != null) {

                return "redirect:/employees/dashboard?id="
                        + user.getEmployeeId();
            }

            session.invalidate();

            model.addAttribute(
                    "error",
                    "Employee account is not linked to an employee."
            );

            return "login";
        }

        session.invalidate();

        model.addAttribute(
                "error",
                "Invalid account role."
        );

        return "login";
    }
}