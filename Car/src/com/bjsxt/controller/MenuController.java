package com.bjsxt.controller;

import com.bjsxt.pojo.Menu;
import com.bjsxt.pojo.TreeResult;
import com.bjsxt.service.MenuService;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class MenuController {

    @Resource
    private MenuService menuService;

    //查询菜单信息，异步树
    @RequestMapping("menuMangerInfo")
    @ResponseBody
    public List<TreeResult> menuMangerInfo(@RequestParam(defaultValue ="0") String id){
        return menuService.selMenuInfoByPidService(id);
    }

    //增加菜单信息
    @RequestMapping("menuAdd")
    @ResponseBody
    public Boolean menuAdd(Menu menu){
        return menuService.insMenuInfoService(menu)>0?true:false;
    }

    //删除菜单信息
    @RequestMapping("menuDel")
    @ResponseBody
    public Boolean menuDel(String id){
        return menuService.delMenuInfoByIdService(id)>0?true:false;
    }

    //修改菜单信息
    @RequestMapping("menuEdit")
    @ResponseBody
    public Boolean menuEdit(String pid,String id,String name,String url){
        return menuService.updateMenuInfo(pid,id,name,url)>0?true:false;
    }


}
