package com.bjsxt.pojo;

public class Role {
    private Integer roleid;
    private String rolename;
    private String roledesc;

    public Role() {
    }

    @Override
    public String toString() {
        return "Role{" +
                "roleid=" + roleid +
                ", rolename='" + rolename + '\'' +
                ", roledesc='" + roledesc + '\'' +
                '}';
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getRoledesc() {
        return roledesc;
    }

    public void setRoledesc(String roledesc) {
        this.roledesc = roledesc;
    }

    public Role(Integer roleid, String rolename, String roledesc) {

        this.roleid = roleid;
        this.rolename = rolename;
        this.roledesc = roledesc;
    }
}
