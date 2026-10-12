package com.employee.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.employee.dao.ManagerDAO;
import com.employee.model.Employee;
import com.employee.util.DBConnection;

public class ManagerDAOImpl implements ManagerDAO {

    @Override
    public List<Employee> getTeamMembers(int managerId) {

        List<Employee> employees = new ArrayList<>();

        String sql = "SELECT * FROM employees "
                   + "WHERE manager_id = ? "
                   + "ORDER BY id";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, managerId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Employee employee = new Employee();

                    employee.setId(rs.getInt("id"));
                    employee.setName(rs.getString("name"));
                    employee.setEmail(rs.getString("email"));
                    employee.setMobile(rs.getString("mobile"));
                    employee.setDeptId(rs.getInt("dept_id"));

                    int managerIdValue = rs.getInt("manager_id");

                    if (rs.wasNull()) {
                        employee.setManagerId(null);
                    } else {
                        employee.setManagerId(managerIdValue);
                    }

                    employee.setJoiningDate(
                            rs.getDate("joining_date")
                    );

                    employee.setBasicSalary(
                            rs.getDouble("basic_salary")
                    );

                    employees.add(employee);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return employees;
    }

    @Override
    public List<Employee> getAllManagers() {

        List<Employee> managers = new ArrayList<>();

        String sql = "SELECT DISTINCT m.* "
                   + "FROM employees e "
                   + "INNER JOIN employees m "
                   + "ON e.manager_id = m.id "
                   + "ORDER BY m.name";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Employee manager = new Employee();

                manager.setId(rs.getInt("id"));
                manager.setName(rs.getString("name"));
                manager.setEmail(rs.getString("email"));
                manager.setMobile(rs.getString("mobile"));
                manager.setDeptId(rs.getInt("dept_id"));

                int managerIdValue = rs.getInt("manager_id");

                if (rs.wasNull()) {
                    manager.setManagerId(null);
                } else {
                    manager.setManagerId(managerIdValue);
                }

                manager.setJoiningDate(
                        rs.getDate("joining_date")
                );

                manager.setBasicSalary(
                        rs.getDouble("basic_salary")
                );

                managers.add(manager);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return managers;
    }
}