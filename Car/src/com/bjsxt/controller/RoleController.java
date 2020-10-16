package com.bjsxt.controller;

import com.bjsxt.pojo.PageResult;
import com.bjsxt.pojo.Role;
import com.bjsxt.service.RoleService;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
public class RoleController {

    @Resource
    private RoleService roleService;

    //声明单元方法：获取角色信息
    @RequestMapping("roleInfo")
    @ResponseBody
    public PageResult<Role> roleInfo(int page,int rows){
         return roleService.selroleInfoService(page,rows);
    }

    //声明单元方法：修改角色信息
    @RequestMapping("roleEdit")
    @ResponseBody
    public Boolean roleEdit(Role role,String ids){
        return roleService.roleEditService(role,ids)>0?true:false;
    }
}
