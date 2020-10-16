package com.bjsxt.pojo;

import java.util.Date;
import java.util.Objects;

public class Check {
    private String checkid;
    private Date checkdate;
    private String checkdesc;
    private Double paymoney;
    private String problem;
    private String opername;
    private String rentid;

    @Override
    public String toString() {
        return "Check{" +
                "checkid='" + checkid + '\'' +
                ", checkdate=" + checkdate +
                ", checkdesc='" + checkdesc + '\'' +
                ", paymoney=" + paymoney +
                ", problem='" + problem + '\'' +
                ", opername='" + opername + '\'' +
                ", rentid='" + rentid + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {

        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Check check = (Check) o;
        return Objects.equals(checkid, check.checkid) &&
                Objects.equals(checkdate, check.checkdate) &&
                Objects.equals(checkdesc, check.checkdesc) &&
                Objects.equals(paymoney, check.paymoney) &&
                Objects.equals(problem, check.problem) &&
                Objects.equals(opername, check.opername) &&
                Objects.equals(rentid, check.rentid);
    }

    @Override
    public int hashCode() {

        return Objects.hash(checkid, checkdate, checkdesc, paymoney, problem, opername, rentid);
    }

    public String getCheckid() {

        return checkid;
    }

    public void setCheckid(String checkid) {
        this.checkid = checkid;
    }

    public Date getCheckdate() {
        return checkdate;
    }

    public void setCheckdate(Date checkdate) {
        this.checkdate = checkdate;
    }

    public String getCheckdesc() {
        return checkdesc;
    }

    public void setCheckdesc(String checkdesc) {
        this.checkdesc = checkdesc;
    }

    public Double getPaymoney() {
        return paymoney;
    }

    public void setPaymoney(Double paymoney) {
        this.paymoney = paymoney;
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }

    public String getOpername() {
        return opername;
    }

    public void setOpername(String opername) {
        this.opername = opername;
    }

    public String getRentid() {
        return rentid;
    }

    public void setRentid(String rentid) {
        this.rentid = rentid;
    }

    public Check() {

    }

    public Check(String checkid, Date checkdate, String checkdesc, Double paymoney, String problem, String opername, String rentid) {

        this.checkid = checkid;
        this.checkdate = checkdate;
        this.checkdesc = checkdesc;
        this.paymoney = paymoney;
        this.problem = problem;
        this.opername = opername;
        this.rentid = rentid;
    }
}
