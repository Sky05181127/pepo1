package com.bjsxt.mapper;

import com.bjsxt.pojo.Role;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RoleMapper {
    //查询角色信息
    @Select("select * from sys_roles limit #{0},#{1}")
    List<Role> selroleInfoMapper(int page, int rows);

    //查询所有角色信息的总数量
    @Select("select count(*) from  sys_roles")
    int selroleCountInfoMapper();

    //增加角色
    int insRoleInfoMapper(Role role);

    int insRoleMenuInfoMapper(@Param("array") String[] idArr, @Param("roleid") Integer roleid);
}
