package com.employee.service;

import java.util.List;

import com.employee.dao.LeaveTypeDAO;
import com.employee.daoimpl.LeaveTypeDAOImpl;
import com.employee.model.LeaveType;

public class LeaveTypeServiceImpl implements LeaveTypeService {

    private LeaveTypeDAO leaveTypeDAO;

    public LeaveTypeServiceImpl() {
        this.leaveTypeDAO = new LeaveTypeDAOImpl();
    }

    @Override
    public boolean addLeaveType(LeaveType leaveType) {
        return leaveTypeDAO.addLeaveType(leaveType);
    }

    @Override
    public boolean updateLeaveType(LeaveType leaveType) {
        return leaveTypeDAO.updateLeaveType(leaveType);
    }

    @Override
    public boolean deleteLeaveType(int id) {
        return leaveTypeDAO.deleteLeaveType(id);
    }

    @Override
    public LeaveType getLeaveTypeById(int id) {
        return leaveTypeDAO.getLeaveTypeById(id);
    }

    @Override
    public List<LeaveType> getAllLeaveTypes() {
        return leaveTypeDAO.getAllLeaveTypes();
    }
}