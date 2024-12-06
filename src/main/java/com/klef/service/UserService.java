package com.klef.service;


import org.springframework.stereotype.Service;


@Service
public interface UserService {

	Object authenticate(String username, String password);
}