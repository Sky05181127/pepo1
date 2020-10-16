package com.bjsxt.mapper;

import com.bjsxt.pojo.Customer;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CustomerMapper {
    //查找所有的客户信息
    List<Customer> selCustomerMapper(@Param("start") int start,@Param("rows") int rows,@Param("identity") String identity,@Param("phone") String phone);

    //查询总行数
    int selCustomerCountMapper(@Param("identity")String identity,@Param("phone") String phone);

    // 增加客户信息
    @Insert("insert into bus_customers values(#{identity},#{custname},#{sex},#{address},#{phone},#{career})")
    int insCustomerInfoMapper(Customer customer);

    //修改客户信息
    @Update("update bus_customers set custname=#{custname},sex=#{sex},address=#{address},phone=#{phone},career=#{career} where identity=#{identity}")
    int updateCustomerInfoMapper(Customer customer);

    //删除客户信息
    @Delete("delete from bus_customers where identity=#{identity}")
    int deleteCustomerMapper(@Param("identity") String identity);
}
