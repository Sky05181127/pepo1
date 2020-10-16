package com.bjsxt.service.Impl;

import com.bjsxt.mapper.RentCarMapper;
import com.bjsxt.mapper.ReturnCarMapper;
import com.bjsxt.pojo.Check;
import com.bjsxt.service.ReturnCarService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ReturnCarServiceImpl implements ReturnCarService {

    @Resource
    private ReturnCarMapper returnCarMapper;

    //归还汽车,生成检查单
    @Override
    public int checkInfoAddService(Check check, String carnumber) {
        //将车辆的出租状态变为 未出租
        int i = returnCarMapper.updateCarIsRentingByCarnumberMapper(carnumber);
        //修改出租单的状态
        i+=returnCarMapper.updateRentFlagByRentIdMapper(check.getRentid());
        //新增出租单
        i+=returnCarMapper.insCheckInfoMapper(check);

        return i;
    }
}
