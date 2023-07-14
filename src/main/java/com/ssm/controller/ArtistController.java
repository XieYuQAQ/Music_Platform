package com.ssm.controller;

import com.ssm.pojo.Album;
import com.ssm.pojo.Artist;
import com.ssm.service.ArtistService;
import com.ssm.tools.ReturnObject;
import com.ssm.tools.contants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ArtistController {

    @Autowired
    ArtistService artistService;

    @RequestMapping("/admin/artist")
    public String pageArtist(){
        return "admin/manage_artist";
    }

    @RequestMapping("/admin/artist/list.do")
    public @ResponseBody Object selectAllArtist(String name,Integer pageNo,Integer pageSize){
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        pageNo=(pageNo-1)*pageSize;
        map.put("beginNo", pageNo);
        map.put("pageSize", pageSize);
        List<Artist> artistList = artistService.selectAllArtist(map);
        int artistRows = artistService.selectCountAllArtist(map);
        Map<String, Object> reMap = new HashMap<>();
        reMap.put("allList", artistList);
        reMap.put("allRows", artistRows);
        return reMap;
    }

    @RequestMapping("/admin/artist/add")
    public String pageAdd(){
        return "admin/manage_artist_add";
    }
    @RequestMapping("/admin/artist/add.do")
    public @ResponseBody Object insertArtist(Artist artist){
        Map<String,Object> map=new HashMap<>();
        map.put("name",artist.getName());
        map.put("dob",artist.getDob());
        map.put("about",artist.getAbout());
        Artist check=artistService.selectReArtist(map);
        ReturnObject returnObject=new ReturnObject();
        if(check==null){
            artistService.insertArtist(artist);
            returnObject.setReturnData(artistService.selectaidByName(artist.getName()));
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
        }else{
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("艺人已经存在");
        }
        return returnObject;
    }

    @RequestMapping("/admin/artist/del.do")
    public @ResponseBody Object deleteArtistById(String[] id){
        ReturnObject returnObject=new ReturnObject();
        try{
            int ret = artistService.deleteArtistById(id);
            if(ret>0){
                //循环删除
                for(int tempNum=0;tempNum < id.length;tempNum++){
                    String filePath = System.getProperty("evan.webapp") + ("assets/images/artist_f/") + id[tempNum] +(".jpg");
                    File delFile = new File(filePath);
                    if(delFile.isFile() && delFile.exists()) {
                        delFile.delete();
                        //如果有则删除
                        returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
                    }else {
                        //这里是找不到文件，但也无所谓，毕竟用户已经删除，对应编号也没有上传图片，不用管，报成功就行
                        returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
                    }
                    filePath = System.getProperty("evan.webapp") + ("assets/images/artist/") + id[tempNum] +(".jpg");
                    delFile = new File(filePath);
                    if(delFile.isFile() && delFile.exists()) {
                        delFile.delete();
                        //如果有则删除
                        returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
                    }else {
                        //这里是找不到文件，但也无所谓，毕竟用户已经删除，对应编号也没有上传图片，不用管，报成功就行
                        returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
                    }
                }
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
            }else {
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return returnObject;
    }

    @RequestMapping("/admin/artist/edit")
    public String pageEdit(){
        return "admin/manage_artist_edit";
    }
    @RequestMapping("/admin/artist/edit.do")
    public @ResponseBody Object selectArtistById(int aid){
        Artist artist=artistService.selectArtistById(aid);
        return artist;
    }
    @RequestMapping("/admin/artist/useedit.do")
    public @ResponseBody Object updateArtist(Artist artist){
        ReturnObject returnObject=new ReturnObject();
        Map<String,Object> map=new HashMap<>();
        map.put("name",artist.getName());
        map.put("aid",artist.getAid());
        int check=artistService.selectReInArtist(map);
        if(check==0){
            try{
                int ret=artistService.updateArtist(artist);
                if(ret > 0){
                    returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
                }else{
                    returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
                }
            }catch (Exception e){
                e.printStackTrace();
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            }
        }else{
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("有重复用户名");
        }
        return  returnObject;
    }

    @RequestMapping("/admin/artist/imagef.do")
    public @ResponseBody Object importArtistFImage(String aid, MultipartFile image) throws IOException {
        ReturnObject returnObject=new ReturnObject();
        try {
            String filePath = System.getProperty("evan.webapp") + ("assets/images/artist_f/") + aid +(".jpg");
            File file=new File(filePath);
            image.transferTo(file);
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
        }catch (Exception e){
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("方形图上传失败");
        }
        return  returnObject;
    }
    @RequestMapping("/admin/artist/image.do")
    public @ResponseBody Object importArtistImage(String aid, MultipartFile image) throws IOException {
        ReturnObject returnObject=new ReturnObject();
        try {
            String filePath = System.getProperty("evan.webapp") + ("assets/images/artist/") + aid +(".jpg");
            File file=new File(filePath);
            image.transferTo(file);
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
        }catch (Exception e){
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("首页图上传失败");
        }
        return  returnObject;
    }

    @RequestMapping("/artist/list.do")
    public @ResponseBody Object selectIndexArtist(String name,Integer pageNo,Integer pageSize){
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        map.put("beginNo", pageNo);
        map.put("pageSize", pageSize);
        List<Artist> artistList = artistService.selectAllArtist(map);
        int allRows = artistService.selectCountAllArtist(map);
        Map<String, Object> reMap = new HashMap<>();
        reMap.put("allRows",allRows);
        reMap.put("allList", artistList);
        return reMap;
    }
    @RequestMapping("/artist/info")
    public String pageArtistInfo(){
        //转跳到添加
        return "artistInfo";
    }

    @RequestMapping("/artist/info.do")
    public @ResponseBody Object selectArtistInfoById(int aid){
        Artist artist=artistService.selectArtistById(aid);
        return artist;
    }
}
