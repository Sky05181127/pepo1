package com.bjsxt.service.Impl;

import com.bjsxt.mapper.CarMapper;
import com.bjsxt.pojo.Car;
import com.bjsxt.pojo.PageResult;
import com.bjsxt.service.CarService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CarServiceImpl implements CarService {
    @Resource
    private CarMapper carMapper;


    //完成汽车修改
    @Override
    public int upCarInfoService(Car car) {
        return carMapper.upCarInfoMapper(car);
    }

    //修改时根据车牌查询车辆信息
    @Override
    public Car carByCarnumberInfoService(String carnumber) {
        return carMapper.carByCarnumberInfoMapper(carnumber);
    }

    //分页查询车辆信息
    @Override
    public PageResult<Car> selCarInfoService(int page, int rows, String carnumber, String cartype, String color) {
        //换算查询行号
        int start=page*rows-rows;
        //分页查询
        List<Car> cars = carMapper.selCarInfoMapper(start, rows, carnumber, cartype, color);
        //获取总的数量
        int total=carMapper.selCarInfoCountMapper( carnumber, cartype, color);
        //封装返回
        return new PageResult<Car>(total,cars);
    }

    //删除当前行数据
    @Override
    public int delCarInfoService(String[] carnumber) {
        return carMapper.delCarInfoMapper(carnumber);
    }

    //增加汽车信息
    @Override
    public int insCarInfoService(Car car) {
        return carMapper.insCarInfoMapper(car);
    }
}
