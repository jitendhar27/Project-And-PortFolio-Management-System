package com.klef.service;


import org.springframework.stereotype.Service;

import com.klef.model.Student;


@Service
public interface UserService {

	Object authenticate(String username, String password);

    boolean isUsernameTaken(String username);

    void saveStudent(Student student);
}