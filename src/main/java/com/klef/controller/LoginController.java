package com.klef.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.klef.model.Admin;
import com.klef.model.Student;
import com.klef.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    private final UserService userService;

    public LoginController(UserService userService) {
        this.userService = userService;
    }

    // Display the index page with login and register options
    @GetMapping("/")
    public ModelAndView showIndexPage() {
        ModelAndView modelAndView = new ModelAndView("index"); // Renders index.jsp
        modelAndView.addObject("message", "Welcome to the Student Portal!");
        return modelAndView;
    }

    // Render the login page
    @GetMapping("/login")
    public ModelAndView showLoginPage(@RequestParam(value = "error", required = false) String error) {
        ModelAndView modelAndView = new ModelAndView("login"); // Renders login.jsp
        if (error != null) {
            modelAndView.addObject("error", "Invalid username or password. Please try again.");
        }
        return modelAndView;
    }

    // Handle login
    @PostMapping("/login")
    public String handleLogin(
            @RequestParam String username, 
            @RequestParam String password, 
            HttpSession session, 
            Model model) {
        
        Object user = userService.authenticate(username, password);

        if (user != null) {
            if (user instanceof Student) {
                Student student = (Student) user;
                session.setAttribute("studentId", student.getId()); // Save the student's ID in the session
                session.setAttribute("studentName", student.getName());
                session.setAttribute("userRole", "STUDENT");
                session.setAttribute("studentUsername", student.getUsername());
                return "redirect:/student/dashboard";
            } else if (user instanceof Admin) {
                Admin admin = (Admin) user;
                session.setAttribute("adminName", admin.getName());
                session.setAttribute("userRole", "ADMIN");
                return "redirect:/admin/dashboard";
            }
        }

        model.addAttribute("error", "Invalid username or password");
        return "login";  // Renders the login page with an error message
    }


    // Render the register page
    @GetMapping("/register")
    public ModelAndView showRegisterPage() {
        return new ModelAndView("register"); // Renders register.jsp
    }

    // Handle logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalidate the current session
        return "redirect:/";  // Redirect to the index page
    }
}
