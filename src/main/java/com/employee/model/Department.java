package com.employee.model;

public class Department {

    private int id;
    private String deptName;
    private String description;

    public Department() {
    }

    public Department(int id, String deptName, String description) {
        this.id = id;
        this.deptName = deptName;
        this.description = description;
    }

    public Department(String deptName, String description) {
        this.deptName = deptName;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Department [id=" + id
                + ", deptName=" + deptName
                + ", description=" + description + "]";
    }
}