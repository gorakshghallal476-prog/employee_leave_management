package com.employee.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.employee.dao.DepartmentDAO;
import com.employee.model.Department;
import com.employee.util.DBConnection;

public class DepartmentDAOImpl implements DepartmentDAO {

    @Override
    public boolean addDepartment(Department department) {

        String sql = "INSERT INTO departments (dept_name, description) VALUES (?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, department.getDeptName());
            preparedStatement.setString(2, department.getDescription());

            int rows = preparedStatement.executeUpdate();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updateDepartment(Department department) {

        String sql = "UPDATE departments SET dept_name = ?, description = ? WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, department.getDeptName());
            preparedStatement.setString(2, department.getDescription());
            preparedStatement.setInt(3, department.getId());

            int rows = preparedStatement.executeUpdate();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteDepartment(int id) {

        String sql = "DELETE FROM departments WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id);

            int rows = preparedStatement.executeUpdate();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public Department getDepartmentById(int id) {

        String sql = "SELECT * FROM departments WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                Department department = new Department();

                department.setId(resultSet.getInt("id"));
                department.setDeptName(resultSet.getString("dept_name"));
                department.setDescription(resultSet.getString("description"));

                return department;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Department> getAllDepartments() {

        List<Department> departments = new ArrayList<>();

        String sql = "SELECT * FROM departments ORDER BY id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {

                Department department = new Department();

                department.setId(resultSet.getInt("id"));
                department.setDeptName(resultSet.getString("dept_name"));
                department.setDescription(resultSet.getString("description"));

                departments.add(department);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return departments;
    }
}