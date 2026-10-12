package com.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.employee.service.LeaveBalanceService;
import com.employee.service.LeaveBalanceServiceImpl;

@Controller
@RequestMapping("/leave-balance")
public class LeaveBalanceController {

    private LeaveBalanceService leaveBalanceService;

    public LeaveBalanceController() {
        leaveBalanceService = new LeaveBalanceServiceImpl();
    }

    @GetMapping
    public String showLeaveBalance(
            @RequestParam("employeeId") int employeeId,
            Model model) {

        model.addAttribute(
                "leaveBalances",
                leaveBalanceService
                    .getLeaveBalancesByEmployeeId(employeeId)
        );

        model.addAttribute("employeeId", employeeId);

        return "leave/leave-balance";
    }
}