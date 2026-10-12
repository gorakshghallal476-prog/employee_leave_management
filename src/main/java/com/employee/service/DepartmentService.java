package com.employee.service;

import java.util.List;

import com.employee.model.Department;

public interface DepartmentService {

    boolean addDepartment(Department department);

    boolean updateDepartment(Department department);

    boolean deleteDepartment(int id);

    Department getDepartmentById(int id);

    List<Department> getAllDepartments();
}