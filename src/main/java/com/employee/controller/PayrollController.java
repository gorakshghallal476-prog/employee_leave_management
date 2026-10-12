package com.employee.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.employee.model.Payroll;
import com.employee.service.PayrollService;
import com.employee.service.PayrollServiceImpl;

@Controller
@RequestMapping("/payroll")
public class PayrollController {

    private PayrollService payrollService;

    public PayrollController() {
        payrollService = new PayrollServiceImpl();
    }

    @GetMapping
    public String showPayrolls(Model model) {

        model.addAttribute(
                "payrolls",
                payrollService.getAllPayrolls()
        );

        return "payroll/payroll";
    }

    @GetMapping("/add")
    public String showAddPayroll() {

        return "payroll/add-payroll";
    }

    @PostMapping("/add")
    public String addPayroll(

            @RequestParam("employeeId")
            int employeeId,

            @RequestParam("payMonth")
            String payMonth,

            @RequestParam("basicPay")
            double basicPay,

            @RequestParam("lopDays")
            int lopDays,

            @RequestParam("deductions")
            double deductions,

            @RequestParam("netSalary")
            double netSalary,

            @RequestParam("paymentDate")
            String paymentDate) {

        Payroll payroll = new Payroll();

        payroll.setEmployeeId(employeeId);
        payroll.setPayMonth(payMonth);
        payroll.setBasicPay(basicPay);
        payroll.setLopDays(lopDays);
        payroll.setDeductions(deductions);
        payroll.setNetSalary(netSalary);
        payroll.setPaymentDate(
                Date.valueOf(paymentDate)
        );

        payrollService.addPayroll(payroll);

        return "redirect:/payroll";
    }

    @GetMapping("/history")
    public String salaryHistory(

            @RequestParam("employeeId")
            int employeeId,

            Model model) {

        List<Payroll> payrolls =
                payrollService
                        .getPayrollsByEmployeeId(employeeId);

        model.addAttribute(
                "payrolls",
                payrolls
        );

        model.addAttribute(
                "employeeId",
                employeeId
        );

        return "payroll/payroll";
    }

    @GetMapping("/salary-slip")
    public String salarySlip(

            @RequestParam("id")
            int id,

            Model model) {

        Payroll payroll =
                payrollService.getPayrollById(id);

        model.addAttribute(
                "payroll",
                payroll
        );

        return "payroll/salary-slip";
    }

    // MY PAYSLIP
    @GetMapping("/my-payslip")
    public String myPayslip(

            @RequestParam("employeeId")
            int employeeId,

            Model model) {

        List<Payroll> payrolls =
                payrollService
                        .getPayrollsByEmployeeId(employeeId);

        if (payrolls != null && !payrolls.isEmpty()) {

            Payroll latestPayroll =
                    payrolls.get(payrolls.size() - 1);

            model.addAttribute(
                    "payroll",
                    latestPayroll
            );

        } else {

            model.addAttribute(
                    "payroll",
                    null
            );
        }

        model.addAttribute(
                "employeeId",
                employeeId
        );

        return "payroll/salary-slip";
    }
}