package com.employee.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.employee.dao.LeaveRequestDAO;
import com.employee.model.LeaveRequest;
import com.employee.util.DBConnection;

public class LeaveRequestDAOImpl implements LeaveRequestDAO {

    @Override
    public boolean addLeaveRequest(LeaveRequest leaveRequest) {

        String sql = "INSERT INTO leave_requests "
                   + "(employee_id, leave_type_id, start_date, end_date, "
                   + "total_days, reason, status, applied_date) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, leaveRequest.getEmployeeId());
            ps.setInt(2, leaveRequest.getLeaveTypeId());
            ps.setDate(3, leaveRequest.getStartDate());
            ps.setDate(4, leaveRequest.getEndDate());
            ps.setInt(5, leaveRequest.getTotalDays());
            ps.setString(6, leaveRequest.getReason());
            ps.setString(7, leaveRequest.getStatus());
            ps.setDate(8, leaveRequest.getAppliedDate());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updateLeaveRequest(LeaveRequest leaveRequest) {

        String sql = "UPDATE leave_requests SET "
                   + "employee_id = ?, leave_type_id = ?, "
                   + "start_date = ?, end_date = ?, total_days = ?, "
                   + "reason = ?, status = ?, applied_date = ? "
                   + "WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, leaveRequest.getEmployeeId());
            ps.setInt(2, leaveRequest.getLeaveTypeId());
            ps.setDate(3, leaveRequest.getStartDate());
            ps.setDate(4, leaveRequest.getEndDate());
            ps.setInt(5, leaveRequest.getTotalDays());
            ps.setString(6, leaveRequest.getReason());
            ps.setString(7, leaveRequest.getStatus());
            ps.setDate(8, leaveRequest.getAppliedDate());
            ps.setInt(9, leaveRequest.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteLeaveRequest(int id) {

        String sql = "DELETE FROM leave_requests WHERE id = ?";

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
    public LeaveRequest getLeaveRequestById(int id) {

        String sql = "SELECT * FROM leave_requests WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return extractLeaveRequest(rs);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<LeaveRequest> getAllLeaveRequests() {

        List<LeaveRequest> leaveRequests = new ArrayList<>();

        String sql = "SELECT * FROM leave_requests ORDER BY id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                leaveRequests.add(extractLeaveRequest(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return leaveRequests;
    }

    @Override
    public List<LeaveRequest> getLeaveRequestsByEmployeeId(int employeeId) {

        List<LeaveRequest> leaveRequests = new ArrayList<>();

        String sql = "SELECT * FROM leave_requests "
                   + "WHERE employee_id = ? ORDER BY id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, employeeId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    leaveRequests.add(extractLeaveRequest(rs));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return leaveRequests;
    }

    @Override
    public List<LeaveRequest> getPendingLeaveRequests() {

        List<LeaveRequest> leaveRequests = new ArrayList<>();

        String sql = "SELECT * FROM leave_requests "
                   + "WHERE status = ? ORDER BY id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, "Pending");

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    leaveRequests.add(extractLeaveRequest(rs));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return leaveRequests;
    }

    private LeaveRequest extractLeaveRequest(ResultSet rs)
            throws Exception {

        LeaveRequest leaveRequest = new LeaveRequest();

        leaveRequest.setId(rs.getInt("id"));
        leaveRequest.setEmployeeId(rs.getInt("employee_id"));
        leaveRequest.setLeaveTypeId(rs.getInt("leave_type_id"));
        leaveRequest.setStartDate(rs.getDate("start_date"));
        leaveRequest.setEndDate(rs.getDate("end_date"));
        leaveRequest.setTotalDays(rs.getInt("total_days"));
        leaveRequest.setReason(rs.getString("reason"));
        leaveRequest.setStatus(rs.getString("status"));
        leaveRequest.setAppliedDate(rs.getDate("applied_date"));

        return leaveRequest;
    }
}