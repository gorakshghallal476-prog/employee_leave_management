package com.employee.model;

import java.sql.Date;

public class LeaveRequest {

    private int id;
    private int employeeId;
    private int leaveTypeId;
    private Date startDate;
    private Date endDate;
    private int totalDays;
    private String reason;
    private String status;
    private Date appliedDate;

    public LeaveRequest() {
    }

    public LeaveRequest(int id, int employeeId, int leaveTypeId,
                        Date startDate, Date endDate,
                        int totalDays, String reason,
                        String status, Date appliedDate) {

        this.id = id;
        this.employeeId = employeeId;
        this.leaveTypeId = leaveTypeId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.totalDays = totalDays;
        this.reason = reason;
        this.status = status;
        this.appliedDate = appliedDate;
    }

    public LeaveRequest(int employeeId, int leaveTypeId,
                        Date startDate, Date endDate,
                        int totalDays, String reason,
                        String status, Date appliedDate) {

        this.employeeId = employeeId;
        this.leaveTypeId = leaveTypeId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.totalDays = totalDays;
        this.reason = reason;
        this.status = status;
        this.appliedDate = appliedDate;
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

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getTotalDays() {
        return totalDays;
    }

    public void setTotalDays(int totalDays) {
        this.totalDays = totalDays;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getAppliedDate() {
        return appliedDate;
    }

    public void setAppliedDate(Date appliedDate) {
        this.appliedDate = appliedDate;
    }

    @Override
    public String toString() {
        return "LeaveRequest [id=" + id
                + ", employeeId=" + employeeId
                + ", leaveTypeId=" + leaveTypeId
                + ", startDate=" + startDate
                + ", endDate=" + endDate
                + ", totalDays=" + totalDays
                + ", reason=" + reason
                + ", status=" + status
                + ", appliedDate=" + appliedDate
                + "]";
    }
}