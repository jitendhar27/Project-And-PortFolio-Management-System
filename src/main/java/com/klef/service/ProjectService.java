package com.klef.service;
import java.util.List;
import java.util.Optional;

import com.klef.model.*;

public interface ProjectService {
	List<Project> getAllProjects();
    Project createProject(Project project);
    Project updateProject(Long id, Project project);
    void deleteProject(Long id);
	List<Project> getProjectsByStudent(Student student);
	Project getProjectById(Long projectId);
}
