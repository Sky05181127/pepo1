package com.bjsxt.service;

import com.bjsxt.pojo.Menu;
import com.bjsxt.pojo.TreeResult;

import java.util.List;

public interface MenuService {

    //查询菜单信息，异步树
    List<TreeResult> selMenuInfoByPidService(String id);

    //增加菜单信息
    int insMenuInfoService(Menu menu);

    //删除菜单信息
    int delMenuInfoByIdService(String id);

    //修改菜单信息
    int updateMenuInfo(String pid, String id, String name, String url);
}
