package com.employee.dao;

import com.employee.model.User;

public interface UserDAO {

    User authenticate(String username, String password);

    User getUserByUsername(String username);
}