package com.klef.service;
import org.springframework.stereotype.Service;

import com.klef.model.Admin;
import com.klef.model.Feedback;
import com.klef.model.Project;
import com.klef.model.Student;
import com.klef.repository.AdminRepository;
import com.klef.repository.FeedbackRepository;
import com.klef.repository.ProjectRepository;
import com.klef.repository.StudentRepository;

import jakarta.persistence.EntityNotFoundException;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    private final ProjectRepository projectRepository;
    private final AdminRepository adminRepository;
    private final StudentRepository studentRepository;
    private final FeedbackRepository feedbackRepository;

    public AdminServiceImpl(StudentRepository studentRepository,ProjectRepository projectRepository, AdminRepository adminRepository, FeedbackRepository feedbackRepository) {
        this.adminRepository = adminRepository;
		this.studentRepository = studentRepository;
        this.projectRepository = projectRepository;
		this.feedbackRepository = feedbackRepository;
    }
    @Override
    public void deleteFeedbackByProjectId(Long projectId) {
        Feedback feedback = feedbackRepository.findByProjectId(projectId);
        if (feedback != null) {
            feedbackRepository.delete(feedback);
        }
    }
    @Override
    public Feedback addFeedback(Long projectId, String feedbackContent) {
        Project project = projectRepository.findById(projectId)
                            .orElseThrow(() -> new EntityNotFoundException("Project not found"));
        Feedback feedback = feedbackRepository.findByProjectId(projectId);
        if (feedback == null) {
            feedback = new Feedback();
            feedback.setProject(project);
        }
        feedback.setFeedback(feedbackContent);
        return feedbackRepository.save(feedback);
    }
    @Override
    public Feedback getFeedbackByProjectId(Long projectId) {
        return feedbackRepository.findByProjectId(projectId);
    }
    @Override
    public Student getStudentById(Long studentId) {
        return studentRepository.findById(studentId).orElseThrow(() -> new EntityNotFoundException("Student not found"));
    }

    @Override
    public void deleteStudent(Long studentId) {
        studentRepository.deleteById(studentId);
    }

    @Override
    public void updateStudent(Student student) {
        studentRepository.save(student);
    }

    @Override
    public Project getProjectById(Long projectId) {
        return projectRepository.findById(projectId).orElseThrow(() -> new EntityNotFoundException("Project not found"));
    }

    @Override
    public void deleteProject(Long projectId) {
        projectRepository.deleteById(projectId);
    }

    @Override
    public void updateProject(Project project) {
        projectRepository.save(project);
    }
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }
    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }
    public List<Project> getProjectsByStudent(Long studentId) {
        return projectRepository.findByStudentId(studentId);
    }
    @Override
    public List<Admin> getAllAdmins() {
        return adminRepository.findAll();
    }

    @Override
    public Admin getAdminById(Long id) {
        return adminRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Admin not found with id: " + id));
    }

    @Override
    public Admin createAdmin(Admin admin) {
        return adminRepository.save(admin);
    }

    @Override
    public Admin updateAdmin(Long id, Admin admin) {
        Admin existingAdmin = getAdminById(id);
        existingAdmin.setName(admin.getName());
        existingAdmin.setEmail(admin.getEmail());
        existingAdmin.setUsername(admin.getUsername());
        existingAdmin.setPassword(admin.getPassword());
        return adminRepository.save(existingAdmin);
    }

    @Override
    public void deleteAdmin(Long id) {
        adminRepository.deleteById(id);
    }
}
