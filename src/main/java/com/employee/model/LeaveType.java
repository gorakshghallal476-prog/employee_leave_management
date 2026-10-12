package com.employee.model;

public class LeaveType {

    private int id;
    private String typeName;
    private int maxDaysAllowed;

    public LeaveType() {
    }

    public LeaveType(int id, String typeName, int maxDaysAllowed) {
        this.id = id;
        this.typeName = typeName;
        this.maxDaysAllowed = maxDaysAllowed;
    }

    public LeaveType(String typeName, int maxDaysAllowed) {
        this.typeName = typeName;
        this.maxDaysAllowed = maxDaysAllowed;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getMaxDaysAllowed() {
        return maxDaysAllowed;
    }

    public void setMaxDaysAllowed(int maxDaysAllowed) {
        this.maxDaysAllowed = maxDaysAllowed;
    }

    @Override
    public String toString() {
        return "LeaveType [id=" + id
                + ", typeName=" + typeName
                + ", maxDaysAllowed=" + maxDaysAllowed + "]";
    }
}