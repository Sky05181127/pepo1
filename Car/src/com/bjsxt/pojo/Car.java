package com.bjsxt.pojo;

public class Car {
    private String carnumber;
    private String cartype;
    private String color;
    private Double price;
    private Double rentprice;
    private Double deposit;
    private Integer isrenting;
    private String description;
    private String carimg;

    public Car() {
    }

    @Override
    public String toString() {
        return "Car{" +
                "carnumber='" + carnumber + '\'' +
                ", cartype='" + cartype + '\'' +
                ", color='" + color + '\'' +
                ", price=" + price +
                ", rentprice=" + rentprice +
                ", deposit=" + deposit +
                ", isrenting=" + isrenting +
                ", description='" + description + '\'' +
                ", carimg='" + carimg + '\'' +
                '}';
    }

    public String getCarnumber() {
        return carnumber;
    }

    public void setCarnumber(String carnumber) {
        this.carnumber = carnumber;
    }

    public String getCartype() {
        return cartype;
    }

    public void setCartype(String cartype) {
        this.cartype = cartype;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getRentprice() {
        return rentprice;
    }

    public void setRentprice(Double rentprice) {
        this.rentprice = rentprice;
    }

    public Double getDeposit() {
        return deposit;
    }

    public void setDeposit(Double deposit) {
        this.deposit = deposit;
    }

    public Integer getIsrenting() {
        return isrenting;
    }

    public void setIsrenting(Integer isrenting) {
        this.isrenting = isrenting;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCarimg() {
        return carimg;
    }

    public void setCarimg(String carimg) {
        this.carimg = carimg;
    }

    public Car(String carnumber, String cartype, String color, Double price, Double rentprice, Double deposit, Integer isrenting, String description, String carimg) {
        this.carnumber = carnumber;
        this.cartype = cartype;
        this.color = color;
        this.price = price;
        this.rentprice = rentprice;
        this.deposit = deposit;
        this.isrenting = isrenting;
        this.description = description;
        this.carimg = carimg;
    }
}
