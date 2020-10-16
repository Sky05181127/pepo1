package com.bjsxt.service.Impl;

import com.bjsxt.mapper.RoleMapper;
import com.bjsxt.pojo.PageResult;
import com.bjsxt.pojo.Role;
import com.bjsxt.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;
    //查询所有的角色信息
    @Override
    public PageResult<Role> selroleInfoService(int page, int rows) {
        //换算起始行号
        int start = page*rows-rows;
        //查询所有的角色信息
        List<Role> list = roleMapper.selroleInfoMapper(page,rows);
        //查询所有角色的总数量
        int total = roleMapper.selroleCountInfoMapper();

        return new PageResult<>(total,list);
    }

    //修改角色信息

    @Override
    public int roleEditService(Role role, String ids) {
        //增加角色
        int i= roleMapper.insRoleInfoMapper(role);
        //增加权限
        //使用逗号分隔菜单ID字符串获取对应的数组
        String[] idArr=ids.split(",");
        //增加
        roleMapper.insRoleMenuInfoMapper(idArr,role.getRoleid());
        return i;
    }
}
