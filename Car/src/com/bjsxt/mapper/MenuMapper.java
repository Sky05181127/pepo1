package com.bjsxt.mapper;

import com.bjsxt.pojo.Menu;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface MenuMapper {
    //根据传过来的id，查询此ID下面的子级id
    @Select("select * from sys_menus where pid=#{pid}")
    List<Menu> selMenuInfoByPid(@Param("pid") String id);

    //增加菜单中，将添加的父菜单的isParent变为1
    @Update("update sys_menus set isParent=#{1} where id=#{0}")
    int updateMenuIsParent(Integer pid, int i);

    //增加菜单中，插入新增菜单的信息
    @Insert("insert into sys_menus values(default,#{pid},#{name},#{url},#{open},#{isParent},#{target},#{icon})")
    int insMenuInfoMapper(Menu menu);

    //删除菜单中，根据子菜单的id值查询父菜单中的子菜单数量
    @Select("select count(*) from sys_menus where pid=(select pid from sys_menus where id=#{id})")
    int selMenuCountByChildrenId(@Param("id") String id);

    //删除菜单中，根据子菜单的id查询父菜单的子菜单的数量，如果父菜单中子菜单的数量为1，则将其isParent变为0
    @Update("update sys_menus m,(select pid from sys_menus where id=#{id}) p set isParent=0 where m.id=p.pid;")
    int updateMenuInfoByChildrenId(String id);

    //删除子菜单信息
    @Delete("delete from sys_menus where id = #{id}")
    int delMenuInfoById(@Param("id") String id);

    //修改菜单信息
    int updateMenuInfoById(@Param("pid") String pid, @Param("id") String id,@Param("name") String name,@Param("url") String url);
}
