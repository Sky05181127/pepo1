package com.bjsxt.mapper;

import com.bjsxt.pojo.Car;
import com.bjsxt.pojo.Rent;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface RentCarMapper {

    //查询所有的车辆信息
    List<Car> selRentCarInfoMapper(@Param("start") int start, @Param("rows") int rows, @Param("carnumber") String carnumber, @Param("cartype") String cartype, @Param("color") String color);

    //查询符合要求的车辆信息的总数量
    int selRentCarInfoCountMapper(@Param("carnumber") String carnumber, @Param("cartype") String cartype, @Param("color") String color);

    //增加租车信息
    @Insert("insert into bus_rents values(#{rentid},#{price},#{begindate},#{returndate},#{rentflag},#{identity},#{carnumber},#{opername})")
    int insRentCarInfoMapper(Rent rent);
    //更新汽车出租状态
    @Update("update bus_cars set isrenting=1 where carnumber=#{carnumber}")
    int updateCarIsRentingByCarnumberMapper(@Param("carnumber") String carnumber);

    //根据出租单编号获取出租单信息
    @Select("select * from bus_rents where rentid=#{rentid}")
    Rent selRentInfoByRentIdMapper(@Param("rentid") String rentid);

    //获取出租单的分页数据
    List<Rent> selRentManagerInfoMapper(@Param("start") int start, @Param("rows") int rows, @Param("identity") String identity,@Param("carnumber") String carnumber, @Param("begindate") String begindate, @Param("returndate") String returndate);
    //获取数量
    int selRentManagerCountInfoMapper(@Param("identity") String identity,@Param("carnumber") String carnumber, @Param("begindate") String begindate, @Param("returndate") String returndate);
}
