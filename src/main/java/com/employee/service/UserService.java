package com.employee.service;

import com.employee.model.User;

public interface UserService {

    User authenticate(String username, String password);

    User getUserByUsername(String username);
}
