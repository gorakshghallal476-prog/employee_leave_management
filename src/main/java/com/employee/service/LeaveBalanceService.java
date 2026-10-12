package com.employee.service;

import java.util.List;

import com.employee.model.LeaveBalance;

public interface LeaveBalanceService {

    boolean addLeaveBalance(LeaveBalance leaveBalance);

    boolean updateLeaveBalance(LeaveBalance leaveBalance);

    boolean deleteLeaveBalance(int id);

    LeaveBalance getLeaveBalanceById(int id);

    List<LeaveBalance> getAllLeaveBalances();

    List<LeaveBalance> getLeaveBalancesByEmployeeId(int employeeId);
}