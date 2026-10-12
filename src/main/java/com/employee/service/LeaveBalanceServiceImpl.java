package com.employee.service;

import java.util.List;

import com.employee.dao.LeaveBalanceDAO;
import com.employee.daoimpl.LeaveBalanceDAOImpl;
import com.employee.model.LeaveBalance;

public class LeaveBalanceServiceImpl implements LeaveBalanceService {

    private LeaveBalanceDAO leaveBalanceDAO;

    public LeaveBalanceServiceImpl() {
        leaveBalanceDAO = new LeaveBalanceDAOImpl();
    }

    @Override
    public boolean addLeaveBalance(LeaveBalance leaveBalance) {
        return leaveBalanceDAO.addLeaveBalance(leaveBalance);
    }

    @Override
    public boolean updateLeaveBalance(LeaveBalance leaveBalance) {
        return leaveBalanceDAO.updateLeaveBalance(leaveBalance);
    }

    @Override
    public boolean deleteLeaveBalance(int id) {
        return leaveBalanceDAO.deleteLeaveBalance(id);
    }

    @Override
    public LeaveBalance getLeaveBalanceById(int id) {
        return leaveBalanceDAO.getLeaveBalanceById(id);
    }

    @Override
    public List<LeaveBalance> getAllLeaveBalances() {
        return leaveBalanceDAO.getAllLeaveBalances();
    }

    @Override
    public List<LeaveBalance> getLeaveBalancesByEmployeeId(
            int employeeId) {
        return leaveBalanceDAO.getLeaveBalancesByEmployeeId(employeeId);
    }
}