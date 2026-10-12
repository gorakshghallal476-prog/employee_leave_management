package com.employee.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.employee.dao.EmployeeDAO;
import com.employee.model.Employee;
import com.employee.util.DBConnection;

public class EmployeeDAOImpl implements EmployeeDAO {

    @Override
    public boolean addEmployee(Employee employee) {

        String sql = "INSERT INTO employees " +
                     "(name, email, mobile, dept_id, manager_id, joining_date, basic_salary) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getEmail());
            preparedStatement.setString(3, employee.getMobile());
            preparedStatement.setInt(4, employee.getDeptId());

            if (employee.getManagerId() == null) {
                preparedStatement.setNull(5, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(5, employee.getManagerId());
            }

            preparedStatement.setDate(6, employee.getJoiningDate());
            preparedStatement.setDouble(7, employee.getBasicSalary());

            int rows = preparedStatement.executeUpdate();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    @Override
    public boolean updateEmployee(Employee employee) {

        String sql = "UPDATE employees SET " +
                     "name = ?, email = ?, mobile = ?, dept_id = ?, " +
                     "manager_id = ?, joining_date = ?, basic_salary = ? " +
                     "WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getEmail());
            preparedStatement.setString(3, employee.getMobile());
            preparedStatement.setInt(4, employee.getDeptId());

            if (employee.getManagerId() == null) {
                preparedStatement.setNull(5, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(5, employee.getManagerId());
            }

            preparedStatement.setDate(6, employee.getJoiningDate());
            preparedStatement.setDouble(7, employee.getBasicSalary());
            preparedStatement.setInt(8, employee.getId());

            int rows = preparedStatement.executeUpdate();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    @Override
    public boolean deleteEmployee(int id) {

        String sql = "DELETE FROM employees WHERE id = ?";

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
    public Employee getEmployeeById(int id) {

        String sql = "SELECT * FROM employees WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {

                return extractEmployee(resultSet);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    @Override
    public List<Employee> getAllEmployees() {

        List<Employee> employees = new ArrayList<>();

        String sql = "SELECT * FROM employees ORDER BY id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql);
             ResultSet resultSet =
                     preparedStatement.executeQuery()) {

            while (resultSet.next()) {

                employees.add(
                        extractEmployee(resultSet)
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return employees;
    }


    @Override
    public List<Employee> searchEmployees(String keyword) {

        List<Employee> employees = new ArrayList<>();

        String sql = "SELECT * FROM employees " +
                     "WHERE name LIKE ? " +
                     "OR email LIKE ? " +
                     "OR mobile LIKE ? " +
                     "ORDER BY id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            String searchKeyword = "%" + keyword + "%";

            preparedStatement.setString(1, searchKeyword);
            preparedStatement.setString(2, searchKeyword);
            preparedStatement.setString(3, searchKeyword);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            while (resultSet.next()) {

                employees.add(
                        extractEmployee(resultSet)
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return employees;
    }


    // Convert ResultSet data into Employee object
    private Employee extractEmployee(ResultSet resultSet)
            throws Exception {

        Employee employee = new Employee();

        employee.setId(
                resultSet.getInt("id")
        );

        employee.setName(
                resultSet.getString("name")
        );

        employee.setEmail(
                resultSet.getString("email")
        );

        employee.setMobile(
                resultSet.getString("mobile")
        );

        employee.setDeptId(
                resultSet.getInt("dept_id")
        );

        int managerId =
                resultSet.getInt("manager_id");

        if (resultSet.wasNull()) {
            employee.setManagerId(null);
        } else {
            employee.setManagerId(managerId);
        }

        employee.setJoiningDate(
                resultSet.getDate("joining_date")
        );

        employee.setBasicSalary(
                resultSet.getDouble("basic_salary")
        );

        return employee;
    }
}