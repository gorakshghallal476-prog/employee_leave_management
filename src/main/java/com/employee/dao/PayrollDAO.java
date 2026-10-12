package com.employee.dao;

import java.util.List;

import com.employee.model.Payroll;

public interface PayrollDAO {

    boolean addPayroll(Payroll payroll);

    boolean updatePayroll(Payroll payroll);

    boolean deletePayroll(int id);

    Payroll getPayrollById(int id);

    List<Payroll> getAllPayrolls();

    List<Payroll> getPayrollsByEmployeeId(int employeeId);
}