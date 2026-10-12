package com.employee.service;

import java.util.List;

import com.employee.dao.DepartmentDAO;
import com.employee.daoimpl.DepartmentDAOImpl;
import com.employee.model.Department;

public class DepartmentServiceImpl implements DepartmentService {

    private DepartmentDAO departmentDAO;

    public DepartmentServiceImpl() {
        departmentDAO = new DepartmentDAOImpl();
    }

    @Override
    public boolean addDepartment(Department department) {
        return departmentDAO.addDepartment(department);
    }

    @Override
    public boolean updateDepartment(Department department) {
        return departmentDAO.updateDepartment(department);
    }

    @Override
    public boolean deleteDepartment(int id) {
        return departmentDAO.deleteDepartment(id);
    }

    @Override
    public Department getDepartmentById(int id) {
        return departmentDAO.getDepartmentById(id);
    }

    @Override
    public List<Department> getAllDepartments() {
        return departmentDAO.getAllDepartments();
    }
}
