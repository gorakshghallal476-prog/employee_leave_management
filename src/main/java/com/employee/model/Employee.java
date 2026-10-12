package com.employee.model;

import java.sql.Date;

public class Employee {

    private int id;
    private String name;
    private String email;
    private String mobile;
    private int deptId;
    private Integer managerId;
    private Date joiningDate;
    private double basicSalary;

    public Employee() {
    }

    public Employee(int id, String name, String email, String mobile,
                    int deptId, Integer managerId,
                    Date joiningDate, double basicSalary) {

        this.id = id;
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.deptId = deptId;
        this.managerId = managerId;
        this.joiningDate = joiningDate;
        this.basicSalary = basicSalary;
    }

    public Employee(String name, String email, String mobile,
                    int deptId, Integer managerId,
                    Date joiningDate, double basicSalary) {

        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.deptId = deptId;
        this.managerId = managerId;
        this.joiningDate = joiningDate;
        this.basicSalary = basicSalary;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }

    public Date getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(Date joiningDate) {
        this.joiningDate = joiningDate;
    }

    public double getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(double basicSalary) {
        this.basicSalary = basicSalary;
    }

    @Override
    public String toString() {
        return "Employee [id=" + id
                + ", name=" + name
                + ", email=" + email
                + ", mobile=" + mobile
                + ", deptId=" + deptId
                + ", managerId=" + managerId
                + ", joiningDate=" + joiningDate
                + ", basicSalary=" + basicSalary + "]";
    }
}