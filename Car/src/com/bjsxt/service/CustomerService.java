package com.bjsxt.service;


import com.bjsxt.pojo.Customer;
import com.bjsxt.pojo.PageResult;

public interface CustomerService {
    //查找所有的客户信息
    PageResult<Customer> selCustomerService(int page, int rows, String identity, String phone);

    //增加客户信息
    int insCustomerInfoService(Customer customer);

    //修改客户信息
    int updateCustomerInfoService(Customer customer);

    //删除客户信息
    int deleteCustomerService(String identity);
}
