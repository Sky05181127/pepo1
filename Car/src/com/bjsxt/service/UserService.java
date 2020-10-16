package com.bjsxt.service;

import com.bjsxt.pojo.TreeResult;
import com.bjsxt.pojo.User;

import java.util.List;

public interface UserService {
    User selUserService(String loginname, String pwd);

    List<TreeResult> selMenuInfoService(Integer userid);

    //修改密码
    int updatePwdService(Integer userid, String newPwd);
}
