package com.ssm.controller;

import com.ssm.pojo.Label;
import com.ssm.pojo.Music;
import com.ssm.pojo.User;
import com.ssm.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

//用于后台页面的转跳
@Controller
public class AdminController {

    @Autowired
    AlbumService albumService;
    @Autowired
    MusicService musicService;
    @Autowired
    ArtistService artistService;
    @Autowired
    LabelService labelService;
    @Autowired
    UserService userService;

    //导航栏
    //控制台 概要
    //转跳到主页
    @RequestMapping("admin")
    public String index(){

        //转发请求
        return("admin/index");
    }
    //管理

    //用户
    @RequestMapping("admin/users")
    public String users(){
        //转发请求
        return("admin/manage_users");
    }

    @RequestMapping("admin/about.do")
    public @ResponseBody Object selectAbout(){
        Map<String, Object> map = new HashMap<>();
        map.put("name","");
        map.put("title","");
        Map<String, Object> reMap = new HashMap<>();
        int allAlbum=albumService.selectCountAllAlbum(map);
        int allMusic=musicService.selectCountAllMusic(map);
        int allArtist=artistService.selectCountAllArtist(map);
        int allLabel=labelService.selectCountAllLabel(map);
        int allUser=userService.selectCountAllUsers(map);
        reMap.put("allAlbum",allAlbum);
        reMap.put("allMusic",allMusic);
        reMap.put("allArtist",allArtist);
        reMap.put("allLabel",allLabel);
        reMap.put("allUser",allUser);
        return reMap;
    }

}
