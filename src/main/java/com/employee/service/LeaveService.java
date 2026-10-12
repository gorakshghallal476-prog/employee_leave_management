package com.employee.service;

import java.util.List;

import com.employee.model.LeaveRequest;

public interface LeaveService {

    boolean applyLeave(LeaveRequest leaveRequest);

    boolean updateLeaveStatus(int id, String status);

    boolean cancelLeave(int id);

    LeaveRequest getLeaveById(int id);

    List<LeaveRequest> getAllLeaves();

    List<LeaveRequest> getEmployeeLeaves(int employeeId);

    List<LeaveRequest> getPendingLeaves();
}