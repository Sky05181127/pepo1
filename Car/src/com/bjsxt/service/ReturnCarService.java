package com.bjsxt.service;

import com.bjsxt.pojo.Check;

public interface ReturnCarService {
    //归还汽车,生成检查单
    int checkInfoAddService(Check check, String carnumber);
}
