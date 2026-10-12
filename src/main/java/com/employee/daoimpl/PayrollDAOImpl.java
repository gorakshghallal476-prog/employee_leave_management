package com.employee.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.employee.dao.PayrollDAO;
import com.employee.model.Payroll;
import com.employee.util.DBConnection;

public class PayrollDAOImpl implements PayrollDAO {

    @Override
    public boolean addPayroll(Payroll payroll) {

        String sql = "INSERT INTO payroll "
                   + "(employee_id, pay_month, basic_pay, lop_days, "
                   + "deductions, net_salary, payment_date) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, payroll.getEmployeeId());
            ps.setString(2, payroll.getPayMonth());
            ps.setDouble(3, payroll.getBasicPay());
            ps.setInt(4, payroll.getLopDays());
            ps.setDouble(5, payroll.getDeductions());
            ps.setDouble(6, payroll.getNetSalary());
            ps.setDate(7, payroll.getPaymentDate());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updatePayroll(Payroll payroll) {

        String sql = "UPDATE payroll SET "
                   + "employee_id = ?, "
                   + "pay_month = ?, "
                   + "basic_pay = ?, "
                   + "lop_days = ?, "
                   + "deductions = ?, "
                   + "net_salary = ?, "
                   + "payment_date = ? "
                   + "WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, payroll.getEmployeeId());
            ps.setString(2, payroll.getPayMonth());
            ps.setDouble(3, payroll.getBasicPay());
            ps.setInt(4, payroll.getLopDays());
            ps.setDouble(5, payroll.getDeductions());
            ps.setDouble(6, payroll.getNetSalary());
            ps.setDate(7, payroll.getPaymentDate());
            ps.setInt(8, payroll.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deletePayroll(int id) {

        String sql = "DELETE FROM payroll WHERE id = ?";

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
    public Payroll getPayrollById(int id) {

        String sql = "SELECT * FROM payroll WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return extractPayroll(rs);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Payroll> getAllPayrolls() {

        List<Payroll> payrolls = new ArrayList<>();

        String sql = "SELECT * FROM payroll ORDER BY id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                payrolls.add(extractPayroll(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return payrolls;
    }

    @Override
    public List<Payroll> getPayrollsByEmployeeId(int employeeId) {

        List<Payroll> payrolls = new ArrayList<>();

        String sql = "SELECT * FROM payroll "
                   + "WHERE employee_id = ? "
                   + "ORDER BY id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, employeeId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    payrolls.add(extractPayroll(rs));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return payrolls;
    }

    private Payroll extractPayroll(ResultSet rs)
            throws Exception {

        Payroll payroll = new Payroll();

        payroll.setId(rs.getInt("id"));
        payroll.setEmployeeId(rs.getInt("employee_id"));
        payroll.setPayMonth(rs.getString("pay_month"));
        payroll.setBasicPay(rs.getDouble("basic_pay"));
        payroll.setLopDays(rs.getInt("lop_days"));
        payroll.setDeductions(rs.getDouble("deductions"));
        payroll.setNetSalary(rs.getDouble("net_salary"));
        payroll.setPaymentDate(rs.getDate("payment_date"));

        return payroll;
    }
}