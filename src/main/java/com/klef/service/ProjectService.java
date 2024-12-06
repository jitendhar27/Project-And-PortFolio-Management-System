package com.klef.service;
import java.util.List;
import com.klef.model.*;

public interface ProjectService {
	List<Project> getAllProjects();
    Project getProjectById(Long id);
    Project createProject(Project project);
    Project updateProject(Long id, Project project);
    void deleteProject(Long id);
	List<Project> getProjectsByStudent(Student student);
}
