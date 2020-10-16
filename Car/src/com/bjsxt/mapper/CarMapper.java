package com.bjsxt.mapper;

import com.bjsxt.pojo.Car;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CarMapper {
    //查询所有的车辆信息
    List<Car> selCarInfoMapper(@Param("start") int start, @Param("rows") int rows, @Param("carnumber") String carnumber, @Param("cartype") String cartype, @Param("color") String color);

    //查询符合要求的车辆信息的总数量
    int selCarInfoCountMapper(@Param("carnumber") String carnumber, @Param("cartype") String cartype, @Param("color") String color);

    //删除当前选中行数据
    int delCarInfoMapper(String[] carnumber);

    //增加汽车信息
    @Insert("insert into bus_cars values(#{carnumber},#{cartype},#{color},#{price},#{rentprice},#{deposit},#{isrenting},#{description},#{carimg})")
    int insCarInfoMapper(Car car);

    //修改时根据车牌查询车辆信息
    @Select("select * from bus_cars where carnumber = #{carnumber}")
    Car carByCarnumberInfoMapper(@Param("carnumber") String carnumber);

    //完成汽车信息修改

    int upCarInfoMapper(Car car);
}
