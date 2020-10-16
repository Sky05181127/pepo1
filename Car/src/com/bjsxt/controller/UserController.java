package com.bjsxt.controller;

import com.bjsxt.pojo.TreeResult;
import com.bjsxt.pojo.User;
import com.bjsxt.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping("userLogin")
    public String userLogin(String loginname, String pwd, HttpSession session){
        User user = userService.selUserService(loginname,pwd);
        if (null!=user){
            session.setAttribute("user",user);
            return "redirect:/main/main.jsp";
        }else{
            session.setAttribute("flag","false");
            return "redirect:/Login.jsp";
        }
    }

    @RequestMapping("selMenuInfo")
    @ResponseBody
    public List<TreeResult> selMenuInfo(HttpSession session) {
        Integer userid = ((User) session.getAttribute("user")).getUserid();
        List<TreeResult> list = userService.selMenuInfoService(userid);
        return list;
    }

    @RequestMapping("userOut")
    public String userOut(HttpSession session) {
        session.invalidate();
        return "redirect:/Login.jsp";
    }

    //校验修改密码中原密码输入是否正确
    @RequestMapping("checkUserPwd")
    @ResponseBody
    public Boolean checkUserPwd(HttpSession session,String oldPwd) {
        String pwd = ((User) session.getAttribute("user")).getPwd();
        return oldPwd.equals(pwd);
    }
    //修改密码
    @RequestMapping("updatePwd")
    @ResponseBody
    public Boolean updatePwd(HttpSession session,String newPwd) {
        Integer userid = ((User) session.getAttribute("user")).getUserid();
        int i = userService.updatePwdService(userid,newPwd);
        if (i>0){
            return true;
        }else{
            return false;
        }
    }
}
