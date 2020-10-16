package com.bjsxt.service.Impl;

import com.bjsxt.mapper.CustomerMapper;
import com.bjsxt.pojo.Customer;
import com.bjsxt.pojo.PageResult;
import com.bjsxt.service.CustomerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService{
    @Resource
    private CustomerMapper customerMapper;

    @Override
    public PageResult<Customer> selCustomerService(int page, int rows, String identity, String phone) {
        //换算起始查询行号
        int start = page*rows-rows;
        //分页查询
        List<Customer> list=customerMapper.selCustomerMapper(start,rows,identity,phone);
        //查询总的数据量
        int total=customerMapper.selCustomerCountMapper(identity,phone);
        //封装PageResult并返回
        return new PageResult<Customer>(total,list);
    }

    //增加客户信息
    @Override
    public int insCustomerInfoService(Customer customer) {
        int i =  customerMapper.insCustomerInfoMapper(customer);
        return i;
    }

    //修改客户信息
    @Override
    public int updateCustomerInfoService(Customer customer) {
        return customerMapper.updateCustomerInfoMapper(customer);
    }

    //删除客户信息
    @Override
    public int deleteCustomerService(String identity) {
        return customerMapper.deleteCustomerMapper(identity);
    }
}
