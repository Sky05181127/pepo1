package com.bjsxt.service;

import com.bjsxt.pojo.Car;
import com.bjsxt.pojo.PageResult;
import com.bjsxt.pojo.Rent;

import java.util.List;

public interface RentCarService {
    //分页查询所有车辆信息
    PageResult<Car> rentCarService(int page, int rows, String carnumber, String cartype, String color);

    //确认出租，将选中车辆信息插入到车辆已出租表中
    String insCarRentInfoService(Rent rent);

    //出租单详情
    List<Object> selRentInfoService(String rentid);

    //获取出租单信息
    PageResult<Rent> selRentManagerInfoService(int page, int rows, String identity, String carnumber, String begindate, String returndate);

}
