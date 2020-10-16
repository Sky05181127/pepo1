package com.bjsxt.pojo;



import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

public class Rent {
    private String rentid;
    private Double price;
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    private Date begindate;
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    private Date returndate;
    private Integer rentflag;
    private String identity;
    private String carnumber;
    private String opername;

    private Customer customer;//存储租车人信息

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Override
    public String
    toString() {
        return "Rent{" +
                "rentid='" + rentid + '\'' +
                ", price=" + price +
                ", begindate=" + begindate +
                ", returndate=" + returndate +
                ", rentflag=" + rentflag +
                ", identity='" + identity + '\'' +
                ", carnumber='" + carnumber + '\'' +
                ", opername='" + opername + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Rent rent = (Rent) o;
        return Objects.equals(rentid, rent.rentid) &&
                Objects.equals(price, rent.price) &&
                Objects.equals(begindate, rent.begindate) &&
                Objects.equals(returndate, rent.returndate) &&
                Objects.equals(rentflag, rent.rentflag) &&
                Objects.equals(identity, rent.identity) &&
                Objects.equals(carnumber, rent.carnumber) &&
                Objects.equals(opername, rent.opername);
    }

    @Override
    public int hashCode() {

        return Objects.hash(rentid, price, begindate, returndate, rentflag, identity, carnumber, opername);
    }

    public String getRentid() {

        return rentid;
    }

    public void setRentid(String rentid) {
        this.rentid = rentid;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getBegindate() {
        return new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(begindate);
    }

    public void setBegindate(Date begindate) {
        this.begindate = begindate;
    }

    public String getReturndate() {
        return new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(returndate);
    }

    public void setReturndate(Date returndate) {
        this.returndate = returndate;
    }

    public Integer getRentflag() {
        return rentflag;
    }

    public void setRentflag(Integer rentflag) {
        this.rentflag = rentflag;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getCarnumber() {
        return carnumber;
    }

    public void setCarnumber(String carnumber) {
        this.carnumber = carnumber;
    }

    public String getOpername() {
        return opername;
    }

    public void setOpername(String opername) {
        this.opername = opername;
    }

    public Rent() {

    }

    public Rent(String rentid, Double price, Date begindate, Date returndate, Integer rentflag, String identity, String carnumber, String opername) {

        this.rentid = rentid;
        this.price = price;
        this.begindate = begindate;
        this.returndate = returndate;
        this.rentflag = rentflag;
        this.identity = identity;
        this.carnumber = carnumber;
        this.opername = opername;
    }
}
