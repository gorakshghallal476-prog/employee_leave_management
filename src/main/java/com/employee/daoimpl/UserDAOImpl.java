package com.employee.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.employee.dao.UserDAO;
import com.employee.model.User;
import com.employee.util.DBConnection;

public class UserDAOImpl implements UserDAO {

    @Override
    public User authenticate(String username, String password) {

        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                User user = new User();

                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setRole(resultSet.getString("role"));

                int employeeId = resultSet.getInt("employee_id");

                if (resultSet.wasNull()) {
                    user.setEmployeeId(null);
                } else {
                    user.setEmployeeId(employeeId);
                }

                return user;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public User getUserByUsername(String username) {

        String sql = "SELECT * FROM users WHERE username = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setString(1, username);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                User user = new User();

                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setRole(resultSet.getString("role"));

                int employeeId = resultSet.getInt("employee_id");

                if (resultSet.wasNull()) {
                    user.setEmployeeId(null);
                } else {
                    user.setEmployeeId(employeeId);
                }

                return user;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}