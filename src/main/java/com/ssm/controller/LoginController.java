package com.ssm.controller;

import com.ssm.pojo.User;
import com.ssm.service.UserService;
import com.ssm.tools.AppMD5;
import com.ssm.tools.ReturnObject;
import com.ssm.tools.contants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


//LoginController用于管理 登录注册页面的转跳
@Controller
public class LoginController {

    @Autowired
    UserService userService;
    //注册登录功能使用UserService

    //登录页面
    @RequestMapping("/login")
    public String login(){
        //转发请求
        return("login/login");
    }

    //注册页面
    @RequestMapping("/register")
    public String register(){
        //转发请求
        return("login/register");
    }
}
