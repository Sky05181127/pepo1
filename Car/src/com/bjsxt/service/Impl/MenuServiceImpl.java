package com.bjsxt.service.Impl;

import com.bjsxt.mapper.MenuMapper;
import com.bjsxt.pojo.Menu;
import com.bjsxt.pojo.TreeResult;
import com.bjsxt.service.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MenuServiceImpl implements MenuService {

    @Resource
    private MenuMapper menuMapper;
    //查询菜单信息，异步树
    @Override
    public List<TreeResult> selMenuInfoByPidService(String id) {
        //查询所有父级id为此id的菜单
        List<Menu> menus = menuMapper.selMenuInfoByPid(id);
        //将List<Menu> 转换为List<TreeResult>
        List<TreeResult> list = new ArrayList<>();
        for (Menu menu:menus){
            TreeResult t = new TreeResult();
            t.setId(menu.getId());
            t.setText(menu.getName());
            t.setState(menu.getIsParent()==1?"closed":"open");
            //创建map集合存储url地址
            Map<String, String> map = new HashMap<>();
            map.put("url",menu.getUrl());
            map.put("isparent",menu.getIsParent()+"");
            t.setAttributes(map); //将map集合存储到TreeResult对象中
            list.add(t); //将对象存储到集合中
        }
        return list;
    }

    //增加菜单信息
    @Override
    public int insMenuInfoService(Menu menu) {
        //将增加的父菜单的isParent的值变为1
        int i = menuMapper.updateMenuIsParent(menu.getPid(),1);
        //设置新增菜单的open和isParent
        menu.setOpen(0);
        menu.setIsParent(0);
        return menuMapper.insMenuInfoMapper(menu);
    }

    //删除菜单信息
    @Override
    public int delMenuInfoByIdService(String id) {
        //先根据id查询父菜单的子菜单的数量
        int count = menuMapper.selMenuCountByChildrenId(id);
        //如果父菜单的子菜单数量只有一个，就将父菜单的isParent变为0
        if (count==1){
            menuMapper.updateMenuInfoByChildrenId(id);
        }
        //将此菜单删除
        return menuMapper.delMenuInfoById(id);
    }

    //修改菜单信息
    @Override
    public int updateMenuInfo(String pid, String id, String name, String url) {
        if (!"请选择".equals(pid)) {
            //根据传过来的id查看父菜单中的子菜单数量
            int count = menuMapper.selMenuCountByChildrenId(id);
            //如果父菜单的子菜单数量只有一个，就将父菜单的isParent变为0
            if (count == 1) {
                menuMapper.updateMenuInfoByChildrenId(id);
            }
            //检验新的父菜单是否已经是父菜单，如果不是，则修改isParent
            menuMapper.updateMenuIsParent(Integer.parseInt(pid),1);
        }else {
            pid = null;
        }
        //修改当前选择的菜单信息
        int i=menuMapper.updateMenuInfoById(pid,id,name,url);
        return i;
    }
}
