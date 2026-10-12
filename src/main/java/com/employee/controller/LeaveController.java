package com.employee.controller;

import java.sql.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.employee.model.LeaveRequest;
import com.employee.service.LeaveServiceImpl;
import com.employee.service.LeaveTypeService;
import com.employee.service.LeaveTypeServiceImpl;

@Controller
@RequestMapping("/leave")
public class LeaveController {

    private LeaveServiceImpl leaveService;
    private LeaveTypeService leaveTypeService;

    public LeaveController() {
        leaveService = new LeaveServiceImpl();
        leaveTypeService = new LeaveTypeServiceImpl();
    }

    // Show Apply Leave page
    @GetMapping("/apply")
    public String showApplyLeave(Model model) {

        model.addAttribute(
                "leaveTypes",
                leaveTypeService.getAllLeaveTypes()
        );

        return "leave/apply-leave";
    }

    // Apply Leave
    @PostMapping("/apply")
    public String applyLeave(
            @RequestParam("employeeId") int employeeId,
            @RequestParam("leaveTypeId") int leaveTypeId,
            @RequestParam("startDate") String startDate,
            @RequestParam("endDate") String endDate,
            @RequestParam("totalDays") int totalDays,
            @RequestParam("reason") String reason) {

        LeaveRequest leaveRequest = new LeaveRequest();

        leaveRequest.setEmployeeId(employeeId);
        leaveRequest.setLeaveTypeId(leaveTypeId);
        leaveRequest.setStartDate(Date.valueOf(startDate));
        leaveRequest.setEndDate(Date.valueOf(endDate));
        leaveRequest.setTotalDays(totalDays);
        leaveRequest.setReason(reason);
        leaveRequest.setStatus("Pending");
        leaveRequest.setAppliedDate(
                new Date(System.currentTimeMillis())
        );

        leaveService.applyLeave(leaveRequest);

        return "redirect:/leave/history?employeeId=" + employeeId;
    }

    // Employee Leave History
    @GetMapping("/history")
    public String leaveHistory(
            @RequestParam("employeeId") int employeeId,
            Model model) {

        model.addAttribute(
                "leaveRequests",
                leaveService.getEmployeeLeaves(employeeId)
        );

        model.addAttribute("employeeId", employeeId);

        return "leave/leave-history";
    }

    // Pending Leaves for Manager/Admin
    @GetMapping("/pending")
    public String pendingLeaves(Model model) {

        model.addAttribute(
                "leaveRequests",
                leaveService.getPendingLeaves()
        );

        return "leave/pending-leaves";
    }

    // Approve Leave
    @GetMapping("/approve")
    public String approveLeave(@RequestParam("id") int id) {

        LeaveRequest leaveRequest =
                leaveService.getLeaveById(id);

        leaveService.updateLeaveStatus(id, "Approved");

        if (leaveRequest != null) {
            return "redirect:/leave/pending";
        }

        return "redirect:/leave/pending";
    }

    // Reject Leave
    @GetMapping("/reject")
    public String rejectLeave(
            @RequestParam("id") int id) {

        leaveService.updateLeaveStatus(id, "Rejected");

        return "redirect:/leave/pending";
    }

    // Cancel Leave
    @GetMapping("/cancel")
    public String cancelLeave(
            @RequestParam("id") int id,
            @RequestParam("employeeId") int employeeId) {

        leaveService.cancelLeave(id);

        return "redirect:/leave/history?employeeId=" + employeeId;
    }
}