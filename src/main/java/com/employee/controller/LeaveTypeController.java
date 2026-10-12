package com.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.employee.model.LeaveType;
import com.employee.service.LeaveTypeService;
import com.employee.service.LeaveTypeServiceImpl;

@Controller
@RequestMapping("/leave-types")
public class LeaveTypeController {

    private LeaveTypeService leaveTypeService;

    public LeaveTypeController() {
        leaveTypeService = new LeaveTypeServiceImpl();
    }

    // Show all leave types
    @GetMapping
    public String showLeaveTypes(Model model) {

        model.addAttribute(
                "leaveTypes",
                leaveTypeService.getAllLeaveTypes()
        );

        return "admin/leave-types";
    }

    // Add leave type
    @PostMapping("/add")
    public String addLeaveType(
            @RequestParam("typeName") String typeName,
            @RequestParam("maxDaysAllowed") int maxDaysAllowed) {

        LeaveType leaveType =
                new LeaveType(typeName, maxDaysAllowed);

        leaveTypeService.addLeaveType(leaveType);

        return "redirect:/leave-types";
    }

    // Delete leave type
    @GetMapping("/delete")
    public String deleteLeaveType(
            @RequestParam("id") int id) {

        leaveTypeService.deleteLeaveType(id);

        return "redirect:/leave-types";
    }

    // Show edit page
    @GetMapping("/edit")
    public String editLeaveType(
            @RequestParam("id") int id,
            Model model) {

        LeaveType leaveType =
                leaveTypeService.getLeaveTypeById(id);

        model.addAttribute("leaveType", leaveType);

        return "admin/edit-leave-type";
    }

    // Update leave type
    @PostMapping("/update")
    public String updateLeaveType(
            @RequestParam("id") int id,
            @RequestParam("typeName") String typeName,
            @RequestParam("maxDaysAllowed") int maxDaysAllowed) {

        LeaveType leaveType =
                new LeaveType(
                        id,
                        typeName,
                        maxDaysAllowed
                );

        leaveTypeService.updateLeaveType(leaveType);

        return "redirect:/leave-types";
    }
}