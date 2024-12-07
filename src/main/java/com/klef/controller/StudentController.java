package com.klef.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.persistence.EntityNotFoundException;
import jakarta.servlet.http.HttpSession;

import com.klef.model.Project;
import com.klef.model.Student;
import com.klef.service.ProjectService;
import com.klef.service.StudentService;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    private final StudentService studentService;
    private final ProjectService projectService;
    @GetMapping("/edit-profile")
    public String showEditProfilePage(HttpSession session, Model model) {
        String username = (String) session.getAttribute("studentUsername");
        System.out.println("Username in edit profile :"+username);
        if (username == null) {
            return "redirect:/login"; 
        }
        Student student = studentService.findByUsername(username);
        model.addAttribute("student", student);
        return "edit_profile";
    }
    @PostMapping("/edit-profile")
    public String updateProfile(@ModelAttribute Student updatedStudent, HttpSession session) {
        Long studentId = (Long) session.getAttribute("studentId");
        if (studentId == null) {
            return "redirect:/login";
        }

        studentService.updateStudent(studentId, updatedStudent);
        session.setAttribute("student", updatedStudent);
        session.setAttribute("studentName", updatedStudent.getName());
        session.setAttribute("studentUsername",updatedStudent.getUsername());
        return "redirect:/student/dashboard";
    }

    
    @GetMapping("/dashboard")
    public String showStudentDashboard(HttpSession session, Model model) {
        String username = (String) session.getAttribute("studentUsername");
        System.out.println("Username :"+ username);
        if (username != null) {
            Student student = studentService.findByUsername(username);
            List<Project> projects = projectService.getProjectsByStudent(student);
            
            System.out.println("Student: " + student.getName());
            projects.forEach(project -> System.out.println("Project: " + project.getName()));
            
            model.addAttribute("student", student);
            model.addAttribute("projects", projects);
        } else {
            return "redirect:/login";
        }
        return "student_dashboard";
    }
    @GetMapping("/add-project")
    public String showAddProjectPage(HttpSession session, Model model) {
    	System.out.println("Requested for add project page");
        String username = (String) session.getAttribute("studentName");
        if (username == null) {
            return "redirect:/login";
        }
        model.addAttribute("studentName", username);
        return "add_project";
    }
    @PostMapping("/add-project")
    public String addProject(@RequestParam("title") String title,@RequestParam("description") String description,@RequestParam("progress") String progress,@RequestParam(value = "mediaUrl", required = false) String mediaUrl,HttpSession session) {
        String username = (String) session.getAttribute("studentUsername");
        if (username == null) {
            return "redirect:/login";
        }
        Student student = studentService.findByUsername(username);
        Project newProject = new Project();
        newProject.setTitle(title);
        newProject.setDescription(description);
        newProject.setProgress(progress);
        newProject.setMediaUrl(mediaUrl);
        newProject.setStudent(student);
 

        projectService.createProject(newProject);
        return "redirect:/student/dashboard";
    }
    @PostMapping("/remove-project")
    public String removeProject(@RequestParam Long projectId) {
    	System.out.println("Received projectId: " + projectId);
        projectService.deleteProject(projectId);
        return "redirect:/student/dashboard";
    }
    
    
    @GetMapping("/view-projects")
    public String viewProjects(HttpSession session, Model model) {
        String username = (String) session.getAttribute("studentUsername");
        System.out.println("Username: " + username);
        if (username != null) {
            Student student = studentService.findByUsername(username);
            List<Project> projects = projectService.getProjectsByStudent(student);

            System.out.println("Student: " + student.getName());
            projects.forEach(project -> System.out.println("Project: " + project.getName()));
            model.addAttribute("student", student);
            model.addAttribute("projects", projects);
        } else {
            return "redirect:/login";
        }
        return "view_projects";
    }

    
    @GetMapping("/create-project")
    public String createProject(HttpSession session, Model model) {
        String studentName = (String) session.getAttribute("studentName");
        if (studentName != null) {
            model.addAttribute("studentName", studentName);
        }
        return "create_project";
    }

    @GetMapping("/edit-project")
    public String editProject(@RequestParam String projectId, HttpSession session, Model model) {
        String studentName = (String) session.getAttribute("studentName");
        if (studentName != null) {
            model.addAttribute("studentName", studentName);
        }

        try {
        	
        	Long pId = Long.parseLong(projectId);
            Project project = projectService.getProjectById(pId);
            model.addAttribute("projectId", project.getId());
            model.addAttribute("projectTitle", project.getTitle());
            model.addAttribute("projectDescription", project.getDescription());
            model.addAttribute("projectProgress", project.getProgress());
            model.addAttribute("projectMediaUrl", project.getMediaUrl());
        } catch (EntityNotFoundException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "redirect:/student/view-projects";
        }

        return "edit_project";
    }
    @PostMapping("/update-project")
    public String updateProject(@RequestParam Long projectId,
                                @RequestParam String title,
                                @RequestParam String description,
                                @RequestParam String progress,
                                @RequestParam(required = false) String mediaUrl,
                                RedirectAttributes redirectAttributes) {
        Project project = new Project();
        project.setTitle(title);
        project.setDescription(description);
        project.setProgress(progress);
        project.setMediaUrl(mediaUrl);
        projectService.updateProject(projectId, project);

        redirectAttributes.addFlashAttribute("successMessage", "Project updated successfully.");
        return "redirect:/student/view-projects";
    }


    @GetMapping("/view-profile")
    public String viewProfile(HttpSession session, Model model) {
        String username = (String) session.getAttribute("studentUsername");
        if (username != null) {
            Student student = studentService.findByUsername(username);
            model.addAttribute("student", student);
        } else {
            return "redirect:/login";
        }
        return "view_profile";
    }
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    public StudentController(StudentService studentService,ProjectService projectservice) {
        this.studentService = studentService;
		this.projectService = projectservice;
    }

    @GetMapping
    public List<Student> getAllStudents() {
        return studentService.getAllStudents();
    }

    @GetMapping("/{id}")
    public Student getStudentById(@PathVariable Long id) {
        return studentService.getStudentById(id);
    }

    @PostMapping
    public Student createStudent(@RequestBody Student student) {
        return studentService.createStudent(student);
    }

    @PutMapping("/{id}")
    public Student updateStudent(@PathVariable Long id, @RequestBody Student student) {
        return studentService.updateStudent(id, student);
    }

    @DeleteMapping("/{id}")
    public void deleteStudent(@PathVariable Long id) {
        studentService.deleteStudent(id);
    }
}
