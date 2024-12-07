package com.klef.service;
import java.util.List;
import com.klef.model.*;

public interface AdminService {
	List<Admin> getAllAdmins();
    Admin getAdminById(Long id);
    Admin createAdmin(Admin admin);
    Admin updateAdmin(Long id, Admin admin);
    void deleteAdmin(Long id);
    public List<Student> getAllStudents();
	List<Project> getProjectsByStudent(Long id);
	List<Project> getAllProjects();
	public Student getStudentById(Long studentId);
	public void deleteStudent(Long studentId);
	public void updateStudent(Student student);
	public Project getProjectById(Long projectId);
	public void deleteProject(Long projectId);
	public void updateProject(Project project);
	Feedback getFeedbackByProjectId(Long projectId);
	Feedback addFeedback(Long projectId, String feedbackContent);
	void deleteFeedbackByProjectId(Long projectId);
}
