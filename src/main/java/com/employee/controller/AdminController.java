package com.employee.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.employee.model.Employee;
import com.employee.model.LeaveRequest;
import com.employee.service.DepartmentService;
import com.employee.service.DepartmentServiceImpl;
import com.employee.service.EmployeeService;
import com.employee.service.EmployeeServiceImpl;
import com.employee.service.LeaveServiceImpl;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private EmployeeService employeeService;
    private DepartmentService departmentService;
    private LeaveServiceImpl leaveService;

    public AdminController() {

        employeeService = new EmployeeServiceImpl();
        departmentService = new DepartmentServiceImpl();
        leaveService = new LeaveServiceImpl();
    }

    @GetMapping
    public String showDashboard(Model model) {

        // Get all employees
        List<Employee> employees =
                employeeService.getAllEmployees();

        // Get all departments
        int departmentCount =
                departmentService.getAllDepartments().size();

        // Get pending leave applications
        List<LeaveRequest> pendingLeaves =
                leaveService.getPendingLeaves();

        // Dashboard statistics
        int totalEmployees = employees.size();
        int pendingLeaveCount = pendingLeaves.size();

        // Send data to JSP
        model.addAttribute(
                "totalEmployees",
                totalEmployees
        );

        model.addAttribute(
                "pendingLeaves",
                pendingLeaveCount
        );

        model.addAttribute(
                "departmentCount",
                departmentCount
        );

        return "admin/dashboard";
    }
}