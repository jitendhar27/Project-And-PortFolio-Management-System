package com.klef.service;
import org.springframework.stereotype.Service;

import com.klef.model.Project;
import com.klef.model.Student;
import com.klef.repository.ProjectRepository;
import com.klef.repository.StudentRepository;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    private final StudentRepository studentRepository;
	private ProjectRepository projectRepository;

    

    @Override
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    @Override
    public Student getStudentById(Long id) {
        return studentRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Student not found with id: " + id));
    }

    @Override
    public Student createStudent(Student student) {
        return studentRepository.save(student);
    }

    public Student updateStudent(Long id, Student student) {
        // Fetch existing student by ID
        Student existingStudent = getStudentById(id);
        
        // Update fields
        existingStudent.setName(student.getName());
        existingStudent.setEmail(student.getEmail());
        existingStudent.setPassword(student.getPassword());
        
        // Save changes
        return studentRepository.save(existingStudent);
    }

    @Override
    public void deleteStudent(Long id) {
        studentRepository.deleteById(id);
    }
    
    
    public StudentServiceImpl(StudentRepository studentRepository, ProjectRepository projectRepository) {
        this.studentRepository = studentRepository;
        this.projectRepository = projectRepository;
    }

    @Override
    public Student findByUsername(String username) {
        return studentRepository.findByUsername(username);  // Retrieve student by username
    }
    

    @Override
    public List<Project> getProjectsByUsername(String username) {
        return projectRepository.findByStudentUsername(username);  // Retrieve projects by student username
    }
    
    
    
}
