package com.bjsxt.service;

import com.bjsxt.pojo.Car;
import com.bjsxt.pojo.PageResult;
import org.springframework.stereotype.Service;


public interface CarService {

    //分页查询车辆信息
    PageResult<Car> selCarInfoService(int page, int rows, String carnumber, String cartype, String color);

    //删除选中的行数据
    int delCarInfoService(String[] carnumber);

    //增加汽车信息
    int insCarInfoService(Car car);

    //修改时根据车牌查询车辆信息
    Car carByCarnumberInfoService(String carnumber);

    //完成汽车修改
    int upCarInfoService(Car car);
}
