package com.klef.service;
import java.util.List;
import com.klef.model.*;

public interface AdminService {
	List<Admin> getAllAdmins();
    Admin getAdminById(Long id);
    Admin createAdmin(Admin admin);
    Admin updateAdmin(Long id, Admin admin);
    void deleteAdmin(Long id);
}
