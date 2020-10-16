package com.bjsxt.service.Impl;

import com.bjsxt.mapper.RentCarMapper;
import com.bjsxt.pojo.Car;
import com.bjsxt.pojo.PageResult;
import com.bjsxt.pojo.Rent;
import com.bjsxt.service.RentCarService;
import com.bjsxt.util.IDUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class RentCarServiceImpl implements RentCarService {
    @Resource
    private RentCarMapper rentCarMapper;

    //获取出租单信息
    @Override
    public PageResult<Rent> selRentManagerInfoService(int page, int rows, String identity, String carnumber, String begindate, String returndate) {
        //换算起始查询行号
        int start=page*rows-rows;
        //分页查询
        List<Rent> list=rentCarMapper.selRentManagerInfoMapper(start,rows,identity,carnumber,begindate,returndate);
        //获取数据量
        int total=rentCarMapper.selRentManagerCountInfoMapper(identity,carnumber,begindate,returndate);
        //封装返回
        return new PageResult<>(total,list);
    }

    //确认出租，将选中车辆信息插入到车辆已出租表中
    @Override
    public String insCarRentInfoService(Rent rent) {
        //获取出租单的ID
        String rentid= IDUtils.getRentId()+"";
        rent.setRentid(rentid);
        //增加租车信息
        int i=rentCarMapper.insRentCarInfoMapper(rent);
        //修改汽车的租赁状态
        i+=rentCarMapper.updateCarIsRentingByCarnumberMapper(rent.getCarnumber());
        return i>0?rentid:"-1";
    }

    @Override
    public PageResult<Car> rentCarService(int page, int rows, String carnumber, String cartype, String color) {
        //换算起始行号
        int start = page*rows-rows;
        //分页查询
        List<Car> cars = rentCarMapper.selRentCarInfoMapper(start, rows, carnumber, cartype, color);
        //查询总的数据量
        int total = rentCarMapper.selRentCarInfoCountMapper(carnumber, cartype, color);
        //封装转发
        return new PageResult<>(total,cars);
    }

    //出租单详情
    @Override
    public List<Object> selRentInfoService(String rentid) {
        //获取出租单信息
        Rent rent=rentCarMapper.selRentInfoByRentIdMapper(rentid);
        //将rent中的数据存储到list集合中
        ArrayList<Object> list=new ArrayList<>();
        list.add(rent.getRentid());
        list.add(rent.getPrice());
        list.add(rent.getBegindate());
        list.add(rent.getReturndate());
        list.add(rent.getRentflag());
        list.add(rent.getIdentity());
        list.add(rent.getCarnumber());
        list.add(rent.getOpername());
        return list;
    }
}
