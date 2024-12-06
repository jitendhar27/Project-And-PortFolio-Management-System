package com.klef.service;

import java.util.List;

import com.klef.model.Project;
import com.klef.model.Student;

public interface StudentService {
	List<Student> getAllStudents();
    Student getStudentById(Long id);
    Student createStudent(Student student);
    Student updateStudent(Long id, Student student);
    void deleteStudent(Long id);
    Student findByUsername(String username); // Find student by username
    List<Project> getProjectsByUsername(String username);
}
