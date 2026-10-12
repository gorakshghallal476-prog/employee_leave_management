package com.employee.model;

public class Manager {

    private int id;
    private int employeeId;
    private String managerName;
    private String department;

    public Manager() {
    }

    public Manager(int id, int employeeId,
                   String managerName, String department) {
        this.id = id;
        this.employeeId = employeeId;
        this.managerName = managerName;
        this.department = department;
    }

    public Manager(int employeeId,
                   String managerName, String department) {
        this.employeeId = employeeId;
        this.managerName = managerName;
        this.department = department;
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

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "Manager [id=" + id
                + ", employeeId=" + employeeId
                + ", managerName=" + managerName
                + ", department=" + department
                + "]";
    }
}