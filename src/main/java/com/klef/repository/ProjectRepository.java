package com.klef.repository;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.model.Project;

public interface ProjectRepository  extends JpaRepository<Project, Long> {
	List<Project> findByStudentUsername(String username);
	List<Project> findByStudentId(Long studentId);
	Optional<Project> findById(Long projectId);
}
