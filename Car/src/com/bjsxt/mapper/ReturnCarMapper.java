package com.bjsxt.mapper;

import com.bjsxt.pojo.Check;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

public interface ReturnCarMapper {

    //将车辆的出租状态变为 未出租
    @Update("update bus_cars set isrenting=0 where carnumber = #{carnumber}")
    int updateCarIsRentingByCarnumberMapper(@Param("carnumber") String carnumber);

    //将出租单状态变为已归还
    @Update("update bus_rents set rentflag=0 where rentid=#{rentid}")
    int updateRentFlagByRentIdMapper(@Param("rentid") String rentid);

    //新增检查单
    @Insert("insert into bus_checks values(#{checkid},now(),#{checkdesc},#{problem},#{paymoney},#{opername},#{rentid})")
    int insCheckInfoMapper(Check check);
}
