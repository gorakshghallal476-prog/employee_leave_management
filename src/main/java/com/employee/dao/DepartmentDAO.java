package com.employee.dao;

import java.util.List;

import com.employee.model.Department;

public interface DepartmentDAO {

    boolean addDepartment(Department department);

    boolean updateDepartment(Department department);

    boolean deleteDepartment(int id);

    Department getDepartmentById(int id);

    List<Department> getAllDepartments();
}