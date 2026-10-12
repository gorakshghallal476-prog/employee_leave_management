package com.employee.dao;

import java.util.List;

import com.employee.model.LeaveRequest;

public interface LeaveRequestDAO {

    boolean addLeaveRequest(LeaveRequest leaveRequest);

    boolean updateLeaveRequest(LeaveRequest leaveRequest);

    boolean deleteLeaveRequest(int id);

    LeaveRequest getLeaveRequestById(int id);

    List<LeaveRequest> getAllLeaveRequests();

    List<LeaveRequest> getLeaveRequestsByEmployeeId(int employeeId);

    List<LeaveRequest> getPendingLeaveRequests();
}