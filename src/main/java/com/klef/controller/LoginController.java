package com.klef.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.klef.model.Admin;
import com.klef.model.Project;
import com.klef.model.Student;
import com.klef.service.AdminService;
import com.klef.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
    private final UserService userService;
    private AdminService adminService;
    public LoginController(UserService userService,AdminService adminService) {
        this.userService = userService;
        this.adminService = adminService;
    }
    @GetMapping("/")
    public ModelAndView showIndexPage() {
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("message", "Welcome to the Student Portal!");
        return modelAndView;
    }
    

    @GetMapping("/login")
    public ModelAndView showLoginPage(@RequestParam(value = "error", required = false) String error) {
        ModelAndView modelAndView = new ModelAndView("login"); // Renders login.jsp
        if (error != null) {
            modelAndView.addObject("error", "Invalid username or password. Please try again.");
        }
        return modelAndView;
    }
    @GetMapping("/home")
    public String home() {
        return "index";  
    }
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
                session.setAttribute("studentId", student.getId());
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
        return "login";
    }
    @GetMapping("/register")
    public ModelAndView showRegisterPage() {
        return new ModelAndView("register");
    }
    @PostMapping("/register")
    public String handleRegister(
            @RequestParam String name,
            @RequestParam String username,
            @RequestParam String email,
            @RequestParam String password,
            Model model) {
        if (userService.isUsernameTaken(username)) {
            model.addAttribute("error", "Username is already taken.");
            return "register";
        }
        Student newStudent = new Student();
        newStudent.setName(name);
        newStudent.setUsername(username);
        newStudent.setEmail(email);
        newStudent.setPassword(password);
        
        userService.saveStudent(newStudent);

        model.addAttribute("success", "Registration successful! Please log in.");
        return "redirect:/login";
    }
    @GetMapping("/about-us")
    public String aboutUs() {
        return "about_us";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
