package com.employee.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.employee.model.Employee;
import com.employee.model.LeaveRequest;
import com.employee.model.LeaveBalance;

import com.employee.service.DepartmentService;
import com.employee.service.DepartmentServiceImpl;
import com.employee.service.EmployeeService;
import com.employee.service.EmployeeServiceImpl;
import com.employee.service.LeaveServiceImpl;
import com.employee.service.LeaveBalanceServiceImpl;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    private EmployeeService employeeService;
    private DepartmentService departmentService;
    private LeaveServiceImpl leaveService;
    private LeaveBalanceServiceImpl leaveBalanceService;

    public EmployeeController() {

        employeeService = new EmployeeServiceImpl();
        departmentService = new DepartmentServiceImpl();
        leaveService = new LeaveServiceImpl();
        leaveBalanceService = new LeaveBalanceServiceImpl();
    }

    // ==============================
    // Employee Dashboard
    // ==============================

    @GetMapping("/dashboard")
    public String showEmployeeDashboard(
            @RequestParam(value = "id", required = false) Integer id,
            Model model) {

        /*
         * For now, if no employee ID is provided,
         * use employee ID 1.
         *
         * Later we will replace this with the
         * logged-in employee's session ID.
         */

        int employeeId = (id != null) ? id : 1;

        // Get employee information
        Employee employee =
                employeeService.getEmployeeById(employeeId);

        // Get employee leave history
        List<LeaveRequest> leaveRequests =
                leaveService.getEmployeeLeaves(employeeId);

        // Get employee leave balances
        List<LeaveBalance> leaveBalances =
                leaveBalanceService
                        .getLeaveBalancesByEmployeeId(employeeId);

        // Calculate pending leaves
        long pendingLeaves = leaveRequests.stream()
                .filter(leave ->
                        "Pending".equalsIgnoreCase(
                                leave.getStatus()))
                .count();

        // Calculate approved leave days
        int approvedLeaveDays = leaveRequests.stream()
                .filter(leave ->
                        "Approved".equalsIgnoreCase(
                                leave.getStatus()))
                .mapToInt(LeaveRequest::getTotalDays)
                .sum();

        // Calculate available leave days
        int availableLeaveDays = leaveBalances.stream()
                .mapToInt(LeaveBalance::getAvailableDays)
                .sum();

        // Add data to JSP
        model.addAttribute("employee", employee);
        model.addAttribute("leaveRequests", leaveRequests);
        model.addAttribute("leaveBalances", leaveBalances);

        model.addAttribute(
                "pendingLeaves",
                pendingLeaves
        );

        model.addAttribute(
                "approvedLeaveDays",
                approvedLeaveDays
        );

        model.addAttribute(
                "availableLeaveDays",
                availableLeaveDays
        );

        return "employee/dashboard";
    }

    // ==============================
    // Display Employee List
    // ==============================

    @GetMapping
    public String showEmployees(Model model) {

        List<Employee> employees =
                employeeService.getAllEmployees();

        model.addAttribute("employees", employees);

        return "employee/employee-list";
    }

    // ==============================
    // Show Add Employee Page
    // ==============================

    @GetMapping("/add")
    public String showAddEmployee(Model model) {

        model.addAttribute(
                "departments",
                departmentService.getAllDepartments()
        );

        return "employee/add-employee";
    }

    // ==============================
    // Add Employee
    // ==============================

    @PostMapping("/add")
    public String addEmployee(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("mobile") String mobile,
            @RequestParam("deptId") int deptId,
            @RequestParam(value = "managerId", required = false)
                    Integer managerId,
            @RequestParam("joiningDate") String joiningDate,
            @RequestParam("basicSalary") double basicSalary) {

        Date date = Date.valueOf(joiningDate);

        Employee employee = new Employee(
                name,
                email,
                mobile,
                deptId,
                managerId,
                date,
                basicSalary
        );

        employeeService.addEmployee(employee);

        return "redirect:/employees";
    }

    // ==============================
    // Show Employee Edit Page
    // ==============================

    @GetMapping("/edit")
    public String editEmployee(
            @RequestParam("id") int id,
            Model model) {

        Employee employee =
                employeeService.getEmployeeById(id);

        model.addAttribute("employee", employee);

        model.addAttribute(
                "departments",
                departmentService.getAllDepartments()
        );

        return "employee/edit-employee";
    }

    // ==============================
    // Update Employee
    // ==============================

    @PostMapping("/update")
    public String updateEmployee(
            @RequestParam("id") int id,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("mobile") String mobile,
            @RequestParam("deptId") int deptId,
            @RequestParam(value = "managerId", required = false)
                    Integer managerId,
            @RequestParam("joiningDate") String joiningDate,
            @RequestParam("basicSalary") double basicSalary) {

        Date date = Date.valueOf(joiningDate);

        Employee employee = new Employee(
                id,
                name,
                email,
                mobile,
                deptId,
                managerId,
                date,
                basicSalary
        );

        employeeService.updateEmployee(employee);

        return "redirect:/employees";
    }

    // ==============================
    // Delete Employee
    // ==============================

    @GetMapping("/delete")
    public String deleteEmployee(
            @RequestParam("id") int id) {

        employeeService.deleteEmployee(id);

        return "redirect:/employees";
    }

    // ==============================
    // Search Employee
    // ==============================

    @GetMapping("/search")
    public String searchEmployees(
            @RequestParam("keyword") String keyword,
            Model model) {

        List<Employee> employees =
                employeeService.searchEmployees(keyword);

        model.addAttribute("employees", employees);

        return "employee/employee-list";
    }

    // ==============================
    // View Employee Profile
    // ==============================

    @GetMapping("/profile")
    public String viewProfile(
            @RequestParam("id") int id,
            Model model) {

        Employee employee =
                employeeService.getEmployeeById(id);

        model.addAttribute("employee", employee);

        return "employee/profile";
    }

    // ==============================
    // Employee Leave Balance
    // ==============================

    @GetMapping("/leave-balance")
    public String viewLeaveBalance(
            @RequestParam("id") int employeeId,
            Model model) {

        List<LeaveBalance> leaveBalances =
                leaveBalanceService
                        .getLeaveBalancesByEmployeeId(employeeId);

        model.addAttribute(
                "leaveBalances",
                leaveBalances
        );

        model.addAttribute(
                "employeeId",
                employeeId
        );

        return "leave/leave-balance";
    }
}