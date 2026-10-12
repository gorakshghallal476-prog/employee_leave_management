package com.employee.service;

import java.util.List;

import com.employee.dao.LeaveRequestDAO;
import com.employee.daoimpl.LeaveRequestDAOImpl;
import com.employee.model.LeaveRequest;

public class LeaveServiceImpl implements LeaveService {

    private LeaveRequestDAO leaveRequestDAO;

    public LeaveServiceImpl() {
        leaveRequestDAO = new LeaveRequestDAOImpl();
    }

    @Override
    public boolean applyLeave(LeaveRequest leaveRequest) {
        return leaveRequestDAO.addLeaveRequest(leaveRequest);
    }

    @Override
    public boolean updateLeaveStatus(int id, String status) {

        LeaveRequest leaveRequest =
                leaveRequestDAO.getLeaveRequestById(id);

        if (leaveRequest != null) {
            leaveRequest.setStatus(status);
            return leaveRequestDAO.updateLeaveRequest(leaveRequest);
        }

        return false;
    }

    @Override
    public boolean cancelLeave(int id) {
        return leaveRequestDAO.deleteLeaveRequest(id);
    }

    @Override
    public LeaveRequest getLeaveById(int id) {
        return leaveRequestDAO.getLeaveRequestById(id);
    }

    @Override
    public List<LeaveRequest> getAllLeaves() {
        return leaveRequestDAO.getAllLeaveRequests();
    }

    @Override
    public List<LeaveRequest> getEmployeeLeaves(int employeeId) {
        return leaveRequestDAO.getLeaveRequestsByEmployeeId(employeeId);
    }

    @Override
    public List<LeaveRequest> getPendingLeaves() {
        return leaveRequestDAO.getPendingLeaveRequests();
    }
}