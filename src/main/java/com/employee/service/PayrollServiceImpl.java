package com.employee.service;

import java.util.List;

import com.employee.dao.PayrollDAO;
import com.employee.daoimpl.PayrollDAOImpl;
import com.employee.model.Payroll;

public class PayrollServiceImpl implements PayrollService {

    private PayrollDAO payrollDAO;

    public PayrollServiceImpl() {
        payrollDAO = new PayrollDAOImpl();
    }

    @Override
    public boolean addPayroll(Payroll payroll) {
        return payrollDAO.addPayroll(payroll);
    }

    @Override
    public boolean updatePayroll(Payroll payroll) {
        return payrollDAO.updatePayroll(payroll);
    }

    @Override
    public boolean deletePayroll(int id) {
        return payrollDAO.deletePayroll(id);
    }

    @Override
    public Payroll getPayrollById(int id) {
        return payrollDAO.getPayrollById(id);
    }

    @Override
    public List<Payroll> getAllPayrolls() {
        return payrollDAO.getAllPayrolls();
    }

    @Override
    public List<Payroll> getPayrollsByEmployeeId(int employeeId) {
        return payrollDAO.getPayrollsByEmployeeId(employeeId);
    }
}