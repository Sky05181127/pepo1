package com.bjsxt.mapper;

import com.bjsxt.pojo.Menu;
import com.bjsxt.pojo.TreeResult;
import com.bjsxt.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;


public interface UserMapper {

    @Select("select * from sys_users where loginname=#{0} and pwd = #{1}")
    User selUserMapper(String loginname, String pwd);

    @Select("select * from sys_menus where id in(select mid from sys_role_menu where rid in(select rid from sys_role_user where uid=#{userid}))")
    List<Menu> selMenuInfoMapper(@Param("userid") Integer userid);

    //修改密码
    @Update("update sys_users set pwd=#{1} where userid=#{0}")
    int updatePwdMapper(Integer userid, String newPwd);
}
