package com.employee.dao;

import java.util.List;

import com.employee.model.LeaveBalance;

public interface LeaveBalanceDAO {

    boolean addLeaveBalance(LeaveBalance leaveBalance);

    boolean updateLeaveBalance(LeaveBalance leaveBalance);

    boolean deleteLeaveBalance(int id);

    LeaveBalance getLeaveBalanceById(int id);

    List<LeaveBalance> getAllLeaveBalances();

    List<LeaveBalance> getLeaveBalancesByEmployeeId(int employeeId);
}