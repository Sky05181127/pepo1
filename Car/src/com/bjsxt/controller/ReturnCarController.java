package com.bjsxt.controller;
import com.bjsxt.pojo.Car;
import com.bjsxt.pojo.Check;
import com.bjsxt.pojo.PageResult;
import com.bjsxt.pojo.User;
import com.bjsxt.service.CarService;
import com.bjsxt.service.ReturnCarService;
import com.bjsxt.util.IDUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ReturnCarController {
    @Resource
    private ReturnCarService returnCarService;
    @Resource
    private CarService carService;

    //声明单元方法：根据客户填写的车牌号查询汽车信息
    @RequestMapping("carInfoTable")
    @ResponseBody
    public PageResult<Car> selCarInfoTable(String carnumber){
        Car car = carService.carByCarnumberInfoService(carnumber);
        List<Car> list = new ArrayList<>();
        list.add(car);
        return new PageResult<>(0,list);
    }

    //声明单元方法：归还汽车检查
    @RequestMapping("checkInfoAdd")
    @ResponseBody
    public Boolean checkInfoAdd(Check check, String carnumber, HttpSession session){
        String opername = ((User)session.getAttribute("user")).getLoginname();
        check.setOpername(opername);
        check.setCheckid(IDUtils.getRentId()+"");
        int i = returnCarService.checkInfoAddService(check,carnumber);
        return i>0?true:false;
    }
}
