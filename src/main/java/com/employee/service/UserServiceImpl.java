package com.employee.service;

import com.employee.dao.UserDAO;
import com.employee.daoimpl.UserDAOImpl;
import com.employee.model.User;

public class UserServiceImpl implements UserService {

    private UserDAO userDAO;

    public UserServiceImpl() {
        userDAO = new UserDAOImpl();
    }

    @Override
    public User authenticate(String username, String password) {
        return userDAO.authenticate(username, password);
    }

    @Override
    public User getUserByUsername(String username) {
        return userDAO.getUserByUsername(username);
    }
}