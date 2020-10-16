package com.bjsxt.pojo;

public class Customer {
    private String identity;
    private String custname;
    private Integer sex;
    private String address;
    private String phone;
    private String career;

    public Customer(String identity, String custname, Integer sex, String address, String phone, String career) {
        this.identity = identity;
        this.custname = custname;
        this.sex = sex;
        this.address = address;
        this.phone = phone;
        this.career = career;
    }

    public Customer() {
    }

    @Override
    public String toString() {
        return "Customer{" +
                "identity='" + identity + '\'' +
                ", custname='" + custname + '\'' +
                ", sex=" + sex +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", career='" + career + '\'' +
                '}';
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getCustname() {
        return custname;
    }

    public void setCustname(String custname) {
        this.custname = custname;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String adress) {
        this.address = adress;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career;
    }
}
