package com.employee.dao;

import java.util.List;

import com.employee.model.LeaveType;

public interface LeaveTypeDAO {

    boolean addLeaveType(LeaveType leaveType);

    boolean updateLeaveType(LeaveType leaveType);

    boolean deleteLeaveType(int id);

    LeaveType getLeaveTypeById(int id);

    List<LeaveType> getAllLeaveTypes();
}