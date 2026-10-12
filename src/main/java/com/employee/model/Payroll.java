package com.employee.model;

import java.sql.Date;

public class Payroll {

    private int id;
    private int employeeId;
    private String payMonth;
    private double basicPay;
    private int lopDays;
    private double deductions;
    private double netSalary;
    private Date paymentDate;

    public Payroll() {
    }

    public Payroll(int id, int employeeId, String payMonth,
                   double basicPay, int lopDays,
                   double deductions, double netSalary,
                   Date paymentDate) {

        this.id = id;
        this.employeeId = employeeId;
        this.payMonth = payMonth;
        this.basicPay = basicPay;
        this.lopDays = lopDays;
        this.deductions = deductions;
        this.netSalary = netSalary;
        this.paymentDate = paymentDate;
    }

    public Payroll(int employeeId, String payMonth,
                   double basicPay, int lopDays,
                   double deductions, double netSalary,
                   Date paymentDate) {

        this.employeeId = employeeId;
        this.payMonth = payMonth;
        this.basicPay = basicPay;
        this.lopDays = lopDays;
        this.deductions = deductions;
        this.netSalary = netSalary;
        this.paymentDate = paymentDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getPayMonth() {
        return payMonth;
    }

    public void setPayMonth(String payMonth) {
        this.payMonth = payMonth;
    }

    public double getBasicPay() {
        return basicPay;
    }

    public void setBasicPay(double basicPay) {
        this.basicPay = basicPay;
    }

    public int getLopDays() {
        return lopDays;
    }

    public void setLopDays(int lopDays) {
        this.lopDays = lopDays;
    }

    public double getDeductions() {
        return deductions;
    }

    public void setDeductions(double deductions) {
        this.deductions = deductions;
    }

    public double getNetSalary() {
        return netSalary;
    }

    public void setNetSalary(double netSalary) {
        this.netSalary = netSalary;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    @Override
    public String toString() {
        return "Payroll [id=" + id
                + ", employeeId=" + employeeId
                + ", payMonth=" + payMonth
                + ", basicPay=" + basicPay
                + ", lopDays=" + lopDays
                + ", deductions=" + deductions
                + ", netSalary=" + netSalary
                + ", paymentDate=" + paymentDate
                + "]";
    }
}