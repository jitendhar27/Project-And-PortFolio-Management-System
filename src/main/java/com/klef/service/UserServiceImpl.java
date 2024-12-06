package com.klef.service;

import org.springframework.stereotype.Service;

import com.klef.model.Admin;
import com.klef.model.Student;
import com.klef.repository.AdminRepository;
import com.klef.repository.StudentRepository;

@Service
public class UserServiceImpl implements UserService {

    private final StudentRepository studentRepository;
    private final AdminRepository adminRepository;

    public UserServiceImpl(StudentRepository studentRepository, AdminRepository adminRepository) {
        this.studentRepository = studentRepository;
        this.adminRepository = adminRepository;
    }

    @Override
    public Object authenticate(String username, String password) {
        // First, check in Student repository
        Student student = studentRepository.findByUsernameAndPassword(username, password);
        if (student != null) {
            return student;
        }

        // Then, check in Admin repository
        Admin admin = adminRepository.findByUsernameAndPassword(username, password);
        if (admin != null) {
            return admin;
        }

        return null; // Return null if no user is found
    }
}
