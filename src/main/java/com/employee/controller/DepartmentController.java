package com.employee.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.employee.model.Department;
import com.employee.service.DepartmentService;
import com.employee.service.DepartmentServiceImpl;

@Controller
@RequestMapping("/departments")
public class DepartmentController {

    private DepartmentService departmentService;

    public DepartmentController() {
        departmentService = new DepartmentServiceImpl();
    }

    // Display all departments
    @GetMapping
    public String showDepartments(Model model) {

        List<Department> departments =
                departmentService.getAllDepartments();

        model.addAttribute("departments", departments);

        return "admin/departments";
    }

    // Add department
    @PostMapping("/add")
    public String addDepartment(
            @RequestParam("deptName") String deptName,
            @RequestParam("description") String description) {

        Department department =
                new Department(deptName, description);

        departmentService.addDepartment(department);

        return "redirect:/departments";
    }

    // Delete department
    @GetMapping("/delete")
    public String deleteDepartment(
            @RequestParam("id") int id) {

        departmentService.deleteDepartment(id);

        return "redirect:/departments";
    }

    // Show edit department page
    @GetMapping("/edit")
    public String editDepartment(
            @RequestParam("id") int id,
            Model model) {

        Department department =
                departmentService.getDepartmentById(id);

        model.addAttribute("department", department);

        return "admin/edit-department";
    }

    // Update department
    @PostMapping("/update")
    public String updateDepartment(
            @RequestParam("id") int id,
            @RequestParam("deptName") String deptName,
            @RequestParam("description") String description) {

        Department department =
                new Department(id, deptName, description);

        departmentService.updateDepartment(department);

        return "redirect:/departments";
    }
}