package com.bjsxt.service;

import com.bjsxt.pojo.PageResult;
import com.bjsxt.pojo.Role;

public interface RoleService {

    //查询所有的角色信息
    PageResult<Role> selroleInfoService(int page, int rows);

    //修改角色信息
    int roleEditService(Role role, String ids);
}
