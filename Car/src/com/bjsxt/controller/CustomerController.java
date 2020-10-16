package com.bjsxt.controller;

import com.bjsxt.pojo.Customer;
import com.bjsxt.pojo.PageResult;
import com.bjsxt.service.CustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class CustomerController {

    @Resource
    private CustomerService customerService;

    //查找所有的用户信息
    @RequestMapping("customerShow")
    @ResponseBody
    public PageResult<Customer> customerShow(int page,int rows,String identity,String phone){
        PageResult<Customer> list = customerService.selCustomerService(page,rows,identity,phone);
        return list;
    }


    //声明单元方法:增加客户信息
    @RequestMapping("customerAdd")
    @ResponseBody
    public Boolean customerAdd(Customer customer){
        //处理请求
        int i = customerService.insCustomerInfoService(customer);
        //响应结果
        System.out.println(i);
        return  i>0?true:false;
    }

    //声明单元方法:修改客户信息
    @RequestMapping("customerUpdate")
    @ResponseBody
    public Boolean customerUpdate(Customer customer){
        //处理请求
        int i = customerService.updateCustomerInfoService(customer);
        //响应结果
        return  i>0?true:false;
    }

    //声明单元方法:删除客户信息
    @RequestMapping("customerDel")
    @ResponseBody
    public Boolean customerDel(String identity){
        //处理请求
        int i = customerService.deleteCustomerService(identity);
        //响应结果
        return  i>0?true:false;
    }
}
