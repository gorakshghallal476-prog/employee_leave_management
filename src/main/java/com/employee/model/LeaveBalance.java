package com.employee.model;

public class LeaveBalance {

    private int id;
    private int employeeId;
    private int leaveTypeId;
    private int availableDays;

    public LeaveBalance() {
    }

    public LeaveBalance(int id, int employeeId, int leaveTypeId,
                        int availableDays) {
        this.id = id;
        this.employeeId = employeeId;
        this.leaveTypeId = leaveTypeId;
        this.availableDays = availableDays;
    }

    public LeaveBalance(int employeeId, int leaveTypeId,
                        int availableDays) {
        this.employeeId = employeeId;
        this.leaveTypeId = leaveTypeId;
        this.availableDays = availableDays;
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

    public int getLeaveTypeId() {
        return leaveTypeId;
    }

    public void setLeaveTypeId(int leaveTypeId) {
        this.leaveTypeId = leaveTypeId;
    }

    public int getAvailableDays() {
        return availableDays;
    }

    public void setAvailableDays(int availableDays) {
        this.availableDays = availableDays;
    }

    @Override
    public String toString() {
        return "LeaveBalance [id=" + id
                + ", employeeId=" + employeeId
                + ", leaveTypeId=" + leaveTypeId
                + ", availableDays=" + availableDays
                + "]";
    }
}