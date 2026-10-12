package com.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.employee.service.LeaveServiceImpl;
import com.employee.service.ManagerService;
import com.employee.service.ManagerServiceImpl;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    private ManagerService managerService;
    private LeaveServiceImpl leaveService;

    public ManagerController() {

        managerService = new ManagerServiceImpl();
        leaveService = new LeaveServiceImpl();

    }

    @GetMapping
    public String showManagers(Model model) {

        model.addAttribute(
                "managers",
                managerService.getAllManagers()
        );

        return "manager/manager-dashboard";
    }

    @GetMapping("/team")
    public String showTeam(
            @RequestParam("managerId") int managerId,
            Model model) {

        model.addAttribute(
                "teamMembers",
                managerService.getTeamMembers(managerId)
        );

        model.addAttribute("managerId", managerId);

        return "manager/team-members";
    }

    @GetMapping("/leave-calendar")
    public String showTeamLeaveCalendar(Model model) {

        model.addAttribute(
                "leaveRequests",
                leaveService.getAllLeaves()
        );

        return "manager/team-leave-calendar";
    }
}