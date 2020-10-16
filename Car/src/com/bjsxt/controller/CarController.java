package com.bjsxt.controller;

import com.bjsxt.pojo.Car;
import com.bjsxt.pojo.Customer;
import com.bjsxt.pojo.PageResult;
import com.bjsxt.service.CarService;
import com.bjsxt.service.CustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class CarController {

    @Resource
    private CarService carService;

    //分页查询车辆信息
    @RequestMapping("carShow")
    @ResponseBody
    public PageResult<Car> carShow(int page, int rows, String carnumber, String cartype, String color){
        return carService.selCarInfoService(page, rows, carnumber, cartype, color);
    }


    //声明单元方法:删除车辆信息
    @RequestMapping("carDel")
    @ResponseBody
    public Boolean carDel(String[] carnumber){
        //处理请求
        int i=carService.delCarInfoService(carnumber);
        //响应结果
        return i>0?true:false;
    }

    //声明单元方法:完成汽车增加
    @RequestMapping("carAdd")
    @ResponseBody
    public Boolean carAdd(Car car, MultipartFile file, HttpServletRequest req) throws IOException {
        //获取图片原始名
        String oldName = file.getOriginalFilename();
        //获取后缀名
        String suffix=oldName.substring(oldName.lastIndexOf("."));
        //创建图片的新的名字
        String newName=""+ UUID.randomUUID()+System.currentTimeMillis()+suffix;
        //获取存储路径
        String realPath = req.getServletContext().getRealPath("/upload");
        //存储图片
        file.transferTo(new File(realPath,newName));
        //存储数据到数据库中
        car.setIsrenting(0);
        car.setCarimg("upload/"+newName);
        int i=carService.insCarInfoService(car);
        return i>0?true:false;
    }


    //声明单元方法:修改时根据车牌查询车辆信息
    @RequestMapping("carByCarnumberInfo")
    @ResponseBody
    public Car carByCarnumberInfo(String carnumber) throws IOException {
       return carService.carByCarnumberInfoService(carnumber);
    }

    //声明单元方法:完成汽车修改
    @RequestMapping("carEdit")
    @ResponseBody
    public Boolean carEdit(Car car, MultipartFile file, HttpServletRequest req) throws IOException {
        String newName="";
        if(file.getSize()>0){
            //获取图片原始名
            String oldName = file.getOriginalFilename();
            //获取后缀名
            String suffix=oldName.substring(oldName.lastIndexOf("."));
            //创建图片的新的名字
            newName=""+ UUID.randomUUID()+System.currentTimeMillis()+suffix;
            //获取存储路径
            String realPath = req.getServletContext().getRealPath("/upload");
            //存储图片
            file.transferTo(new File(realPath,newName));
        }

        //存储数据到数据库中
        car.setIsrenting(0);
        car.setCarimg("upload/"+newName);
        int i=carService.upCarInfoService(car);
        return i>0?true:false;
    }
}
