package com.employee.dao;

import java.util.List;

import com.employee.model.Employee;

public interface ManagerDAO {

    List<Employee> getTeamMembers(int managerId);

    List<Employee> getAllManagers();
}