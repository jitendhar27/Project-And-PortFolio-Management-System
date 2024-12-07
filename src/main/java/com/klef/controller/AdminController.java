package com.klef.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.klef.model.Admin;
import com.klef.model.Feedback;
import com.klef.model.Project;
import com.klef.model.Student;
import com.klef.service.AdminService;

import jakarta.servlet.http.HttpSession;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final AdminService adminService;
    @PostMapping("/edit-student")
    public String editStudent(@RequestParam Long studentId, @RequestParam String name, @RequestParam String email) {
        try {
			Student student = adminService.getStudentById(studentId);
			student.setName(name);
			student.setEmail(email);
			adminService.updateStudent(student);
			return "redirect:/admin/students";
		} catch (Exception e) {
			e.printStackTrace();
			
			return "redirect:/admin/students";
		}
    }
    @PostMapping("/add-feedback")
    public String addFeedback(@RequestParam("projectId") Long projectId,
                              @RequestParam("feedback") String feedbackContent) {
        adminService.addFeedback(projectId, feedbackContent);
        return "redirect:/admin/manage-projects";
    }
    @GetMapping("/feedback/{projectId}")
    public String viewFeedback(@PathVariable Long projectId, Model model) {
        Feedback feedback = adminService.getFeedbackByProjectId(projectId);
        model.addAttribute("feedback", feedback);
        return "feedback-details";
    }
    @GetMapping("/students")
    public ModelAndView showStudentList() {
        List<Student> students = adminService.getAllStudents();
        ModelAndView modelAndView = new ModelAndView("admin_students");
        modelAndView.addObject("students", students);
        return modelAndView;
    }
    @PostMapping("/remove-student")
    public String removeStudent(@RequestParam Long studentId) {
        adminService.deleteStudent(studentId);
        return "redirect:/admin/students";
    }
    @PostMapping("/edit-project")
    public String editProject(@RequestParam Long projectId, @RequestParam String title, 
                               @RequestParam String description, @RequestParam String progress) {
        Project project = adminService.getProjectById(projectId);
        project.setTitle(title);
        project.setDescription(description);
        project.setProgress(progress);
        adminService.updateProject(project);
        return "redirect:/admin/projects";
    }
    
    @PostMapping("/remove-project")
    public String removeProject(@RequestParam Long projectId) {
        adminService.deleteProject(projectId);
        return "redirect:/admin/projects";
    }
    @GetMapping("/projects")
    public ModelAndView showProjectList() {
        List<Project> projects = adminService.getAllProjects();
        ModelAndView modelAndView = new ModelAndView("admin_projects");
        modelAndView.addObject("projects", projects);
        return modelAndView;
    }
    @GetMapping("/dashboard")
    public ModelAndView adminDashboard(HttpSession session) {
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null || !userRole.equals("ADMIN")) {
            return new ModelAndView("redirect:/login");
        }
        ModelAndView modelAndView = new ModelAndView("admin_dashboard");
        List<Student> students = adminService.getAllStudents();
        List<Project> projects = adminService.getAllProjects();
        modelAndView.addObject("students", students);
        modelAndView.addObject("projects", projects);
        modelAndView.addObject("adminName", session.getAttribute("adminName"));
        return modelAndView;
    }
    
    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @GetMapping
    public List<Admin> getAllAdmins() {
        return adminService.getAllAdmins();
    }

    @PostMapping
    public Admin createAdmin(@RequestBody Admin admin) {
        return adminService.createAdmin(admin);
    }

    @PutMapping("/{id}")
    public Admin updateAdmin(@PathVariable Long id, @RequestBody Admin admin) {
        return adminService.updateAdmin(id, admin);
    }

    @DeleteMapping("/{id}")
    public void deleteAdmin(@PathVariable Long id) {
        adminService.deleteAdmin(id);
    }
}

