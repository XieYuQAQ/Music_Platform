package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


//IndexControl用于转跳主页
@Controller
public class IndexController {
    //转跳到主页
    @RequestMapping("/")
    public String index(){
        //转发请求
        return("index");
    }
    //最新信息
    @RequestMapping("/news")
    public String pageNews(){
        //转发请求
        return("news");
    }
    @RequestMapping("/album")
    public String pageAlbum(){
        //转跳到添加
        return "album";
    }
    @RequestMapping("/artist")
    public String pageArtist(){
        //转跳到添加
        return "artist";
    }
    @RequestMapping("/search")
    public String pageSearch(){
        //转跳到添加
        return "search";
    }
    @RequestMapping("/library")
    public String pageLibrary(){
        //转跳到添加
        return "library";
    }

    @RequestMapping("/label")
    public String pageLabel(){
        //转跳到添加
        return "label";
    }
    @RequestMapping("/labelAlbum")
    public String pageLabelAlbum(){
        //转跳到添加
        return "labelAlbum";
    }
}
