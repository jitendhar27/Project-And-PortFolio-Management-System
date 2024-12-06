package com.klef.repository;



import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, Long> {
	Admin findByUsernameAndPassword(String username, String password);
}
