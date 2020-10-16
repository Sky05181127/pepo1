package com.bjsxt.controller;

import com.bjsxt.pojo.Car;
import com.bjsxt.pojo.PageResult;
import com.bjsxt.pojo.Rent;
import com.bjsxt.pojo.User;
import com.bjsxt.service.RentCarService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ServiceController {
    @Resource
    private RentCarService rentCarService;

    //声明单元方法：分页查询车辆信息
    @RequestMapping("rentCar")
    @ResponseBody
    public PageResult<Car> rentCar(int page,int rows,String carnumber,String cartype,String color){
       return rentCarService.rentCarService(page,rows,carnumber,cartype,color);
    }

    //声明单元方法:确认出租
    @RequestMapping("rentCarInfo")
    @ResponseBody
    public String rentCarInfo(Rent rent, HttpSession session){
        //处理请求
        //获取session中的操作人信息
        String opername = ((User) session.getAttribute("user")).getLoginname();
        rent.setOpername(opername);
        rent.setRentflag(1);
        //调用业务层完成汽车出租
        String rentid=rentCarService.insCarRentInfoService(rent);
        //响应结果
        return  rentid;
    }

    //声明单元方法：出租单详情
    @RequestMapping("rentInfo")
    @ResponseBody
    public List<Object> rentInfo(String rentid){
        return rentCarService.selRentInfoService(rentid);
    }

    //声明单元方法:获取出租单信息
    @RequestMapping("rentManagerShow")
    @ResponseBody
    public PageResult<Rent> rentManagerInfo(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "2") int rows, String identity, String carnumber, String begindate, String returndate){
        return  rentCarService.selRentManagerInfoService(page,rows,identity,carnumber,begindate,returndate);
    }
}
