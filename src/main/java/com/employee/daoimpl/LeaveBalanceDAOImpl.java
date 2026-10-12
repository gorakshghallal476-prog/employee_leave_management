package com.employee.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.employee.dao.LeaveBalanceDAO;
import com.employee.model.LeaveBalance;
import com.employee.util.DBConnection;

public class LeaveBalanceDAOImpl implements LeaveBalanceDAO {

    @Override
    public boolean addLeaveBalance(LeaveBalance leaveBalance) {

        String sql = "INSERT INTO leave_balances "
                   + "(employee_id, leave_type_id, available_days) "
                   + "VALUES (?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, leaveBalance.getEmployeeId());
            ps.setInt(2, leaveBalance.getLeaveTypeId());
            ps.setInt(3, leaveBalance.getAvailableDays());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updateLeaveBalance(LeaveBalance leaveBalance) {

        String sql = "UPDATE leave_balances SET "
                   + "employee_id = ?, "
                   + "leave_type_id = ?, "
                   + "available_days = ? "
                   + "WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, leaveBalance.getEmployeeId());
            ps.setInt(2, leaveBalance.getLeaveTypeId());
            ps.setInt(3, leaveBalance.getAvailableDays());
            ps.setInt(4, leaveBalance.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteLeaveBalance(int id) {

        String sql = "DELETE FROM leave_balances WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public LeaveBalance getLeaveBalanceById(int id) {

        String sql = "SELECT * FROM leave_balances WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return extractLeaveBalance(rs);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<LeaveBalance> getAllLeaveBalances() {

        List<LeaveBalance> leaveBalances = new ArrayList<>();

        String sql = "SELECT * FROM leave_balances ORDER BY id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                leaveBalances.add(extractLeaveBalance(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return leaveBalances;
    }

    @Override
    public List<LeaveBalance> getLeaveBalancesByEmployeeId(
            int employeeId) {

        List<LeaveBalance> leaveBalances = new ArrayList<>();

        String sql = "SELECT * FROM leave_balances "
                   + "WHERE employee_id = ? "
                   + "ORDER BY id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, employeeId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    leaveBalances.add(extractLeaveBalance(rs));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return leaveBalances;
    }

    private LeaveBalance extractLeaveBalance(ResultSet rs)
            throws Exception {

        LeaveBalance leaveBalance = new LeaveBalance();

        leaveBalance.setId(rs.getInt("id"));
        leaveBalance.setEmployeeId(rs.getInt("employee_id"));
        leaveBalance.setLeaveTypeId(rs.getInt("leave_type_id"));
        leaveBalance.setAvailableDays(
                rs.getInt("available_days")
        );

        return leaveBalance;
    }
}