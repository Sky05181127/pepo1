package com.bjsxt.service.Impl;

import com.bjsxt.mapper.UserMapper;
import com.bjsxt.pojo.Menu;
import com.bjsxt.pojo.TreeResult;
import com.bjsxt.pojo.User;
import com.bjsxt.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public User selUserService(String loginname, String pwd) {
        User user = userMapper.selUserMapper(loginname,pwd);
        return user;
    }

    //修改密码
    @Override
    public int updatePwdService(Integer userid, String newPwd) {
        int i = userMapper.updatePwdMapper(userid,newPwd);
        return i;
    }

    @Override
    public List<TreeResult> selMenuInfoService(Integer userid) {
        List<Menu> menus = userMapper.selMenuInfoMapper(userid);

        List<TreeResult> list=getTreeMenu(menus,0);
        return list;
    }

    private List<TreeResult> getTreeMenu(List<Menu> menus, int pid) {
        //创建List集合存储结果
        List<TreeResult> list=new ArrayList<>();
        //遍历List<Menu>
        for(Menu m:menus){
            if(m.getPid()==pid){
                //创建TreeResult对象
                TreeResult tr=new TreeResult();
                tr.setId(m.getId());
                tr.setText(m.getName());
                list.add(tr);
                //创建Map集合
                Map<String,String> map=new HashMap<>();
                map.put("url",m.getUrl());
                tr.setAttributes(map);
                //判断当前的菜单是否为父菜单
                if(m.getIsParent()==1){//递归的结束条件
                    List<TreeResult> treeMenu = getTreeMenu(menus, m.getId());
                    tr.setChildren(treeMenu);
                    tr.setState("closed");
                }
            }
        }
        return list;
    }
}
