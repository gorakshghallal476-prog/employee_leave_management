package com.employee.dao;

import java.util.List;

import com.employee.model.Employee;

public interface EmployeeDAO {

    boolean addEmployee(Employee employee);

    boolean updateEmployee(Employee employee);

    boolean deleteEmployee(int id);

    Employee getEmployeeById(int id);

    List<Employee> getAllEmployees();

    List<Employee> searchEmployees(String keyword);
}