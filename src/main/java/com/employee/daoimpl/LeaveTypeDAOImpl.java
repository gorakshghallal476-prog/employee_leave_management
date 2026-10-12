
package com.employee.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.employee.dao.LeaveTypeDAO;
import com.employee.model.LeaveType;
import com.employee.util.DBConnection;

public class LeaveTypeDAOImpl implements LeaveTypeDAO {

    @Override
    public boolean addLeaveType(LeaveType leaveType) {

        String sql = "INSERT INTO leave_types " +
                     "(type_name, max_days_allowed) VALUES (?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setString(1, leaveType.getTypeName());
            preparedStatement.setInt(2, leaveType.getMaxDaysAllowed());

            int rows = preparedStatement.executeUpdate();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    @Override
    public boolean updateLeaveType(LeaveType leaveType) {

        String sql = "UPDATE leave_types SET " +
                     "type_name = ?, max_days_allowed = ? " +
                     "WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setString(1, leaveType.getTypeName());
            preparedStatement.setInt(2, leaveType.getMaxDaysAllowed());
            preparedStatement.setInt(3, leaveType.getId());

            int rows = preparedStatement.executeUpdate();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    @Override
    public boolean deleteLeaveType(int id) {

        String sql = "DELETE FROM leave_types WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id);

            int rows = preparedStatement.executeUpdate();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    @Override
    public LeaveType getLeaveTypeById(int id) {

        String sql = "SELECT * FROM leave_types WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {

                LeaveType leaveType = new LeaveType();

                leaveType.setId(
                        resultSet.getInt("id")
                );

                leaveType.setTypeName(
                        resultSet.getString("type_name")
                );

                leaveType.setMaxDaysAllowed(
                        resultSet.getInt("max_days_allowed")
                );

                return leaveType;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    @Override
    public List<LeaveType> getAllLeaveTypes() {

        List<LeaveType> leaveTypes = new ArrayList<>();

        String sql = "SELECT * FROM leave_types ORDER BY id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql);
             ResultSet resultSet =
                     preparedStatement.executeQuery()) {

            while (resultSet.next()) {

                LeaveType leaveType = new LeaveType();

                leaveType.setId(
                        resultSet.getInt("id")
                );

                leaveType.setTypeName(
                        resultSet.getString("type_name")
                );

                leaveType.setMaxDaysAllowed(
                        resultSet.getInt("max_days_allowed")
                );

                leaveTypes.add(leaveType);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return leaveTypes;
    }
}