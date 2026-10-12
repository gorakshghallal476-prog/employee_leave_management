package com.employee.service;

import java.util.List;

import com.employee.dao.EmployeeDAO;
import com.employee.daoimpl.EmployeeDAOImpl;
import com.employee.model.Employee;

public class EmployeeServiceImpl implements EmployeeService {

    private EmployeeDAO employeeDAO;

    public EmployeeServiceImpl() {
        employeeDAO = new EmployeeDAOImpl();
    }

    @Override
    public boolean addEmployee(Employee employee) {
        return employeeDAO.addEmployee(employee);
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        return employeeDAO.updateEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) {
        return employeeDAO.deleteEmployee(id);
    }

    @Override
    public Employee getEmployeeById(int id) {
        return employeeDAO.getEmployeeById(id);
    }

    @Override
    public List<Employee> getAllEmployees() {
        return employeeDAO.getAllEmployees();
    }

    @Override
    public List<Employee> searchEmployees(String keyword) {
        return employeeDAO.searchEmployees(keyword);
    }
}