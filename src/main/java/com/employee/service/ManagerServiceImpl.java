package com.employee.service;

import java.util.List;

import com.employee.dao.ManagerDAO;
import com.employee.daoimpl.ManagerDAOImpl;
import com.employee.model.Employee;

public class ManagerServiceImpl implements ManagerService {

    private ManagerDAO managerDAO;

    public ManagerServiceImpl() {
        managerDAO = new ManagerDAOImpl();
    }

    @Override
    public List<Employee> getTeamMembers(int managerId) {
        return managerDAO.getTeamMembers(managerId);
    }

    @Override
    public List<Employee> getAllManagers() {
        return managerDAO.getAllManagers();
    }
}