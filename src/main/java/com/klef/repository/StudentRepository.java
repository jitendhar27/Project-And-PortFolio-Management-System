package com.klef.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.model.Student;


public interface StudentRepository extends JpaRepository<Student, Long> {
	Student findByUsername(String username);
	Student findByUsernameAndPassword(String username, String password);
	
}
