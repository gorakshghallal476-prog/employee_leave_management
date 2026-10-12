package com.employee.service;

import java.util.List;

import com.employee.model.Employee;

public interface ManagerService {

    List<Employee> getTeamMembers(int managerId);

    List<Employee> getAllManagers();
}