package com.ssm.controller;
import com.ssm.pojo.Music;
import com.ssm.service.MusicService;
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
public class MusicController {

    @Autowired
    MusicService musicService;

    @RequestMapping("/admin/music")
    public String pageMusic(){
        //转发请求
        return("admin/manage_music");
    }

    @RequestMapping("/admin/music/list.do")
    public @ResponseBody Object selectAllLabel(String name, Integer pageNo, Integer pageSize) {
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        pageNo=(pageNo-1)*pageSize;
        map.put("beginNo", pageNo);
        map.put("pageSize", pageSize);
        List<Music> list = musicService.selectAllMusic(map);
        int allRows = musicService.selectCountAllMusic(map);
        Map<String, Object> reMap = new HashMap<>();
        reMap.put("allList", list);
        reMap.put("allRows", allRows);
        return reMap;
    }

    @RequestMapping("/admin/music/add")
    public String pageAdd(){
        //转发请求
        return("admin/manage_music_add");
    }

    @RequestMapping("/admin/music/add.do")
    public @ResponseBody Object insertMusic(Music music){
        ReturnObject returnObject=new ReturnObject();
        Map<String,Object> map=new HashMap<>();
        map.put("name",music.getName());
//        Music check=musicService.selectReMusic(map);
//        if(check==null){
            map.put("title",music.getTitle());
            Music check=musicService.selectAlid(map);
            if(check==null){
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
                returnObject.setMessage("没有找到相关专辑，请检查");
            }else{
                music.setAlid(check.getAlid());
                musicService.insertMusic(music);
                returnObject.setReturnData(musicService.selectMidByName(music));
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
            }
//        }else{
//            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
//            returnObject.setMessage("有重复音乐名");
//        }
        return returnObject;
    }

    @RequestMapping("/admin/music/del.do")
    public @ResponseBody Object deleteMusicById(String[] id){
        ReturnObject returnObject=new ReturnObject();
        try{
            int ret = musicService.deleteMusicById(id);
            if(ret>0){
                for(int tempNum=0;tempNum < id.length;tempNum++){
                    String filePath = System.getProperty("evan.webapp") + ("assets/music/") + id[tempNum] +(".mp3");
                    File delFile = new File(filePath);
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

    @RequestMapping("/admin/music/edit")
    public String pageEdit(){
        //转跳到修改
        return "admin/manage_music_edit";
    }

    @RequestMapping("/admin/music/edit.do")
    public @ResponseBody Object selectMusicById(int mid){
        Music music= musicService.selectMusicById(mid);
        return music;
    }
    @RequestMapping("/admin/music/useedit.do")
    public @ResponseBody Object updateMusic(Music music){
        ReturnObject returnObject=new ReturnObject();
        Map<String,Object> map=new HashMap<>();
        map.put("name",music.getName());
        map.put("mid",music.getMid());
        Music check;
//        int check_re=musicService.selectReInMusic(map);
//        if(check_re==0){
            map.put("title",music.getTitle());
            check=musicService.selectAlid(map);
            if(check==null){
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
                returnObject.setMessage("没有找到相关专辑，请检查");
            }else{
                music.setAlid(check.getAlid());
                try{
                    int ret=musicService.updateMusic(music);
                    if(ret > 0){
                        returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
                    }else{
                        returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
                    }
                }catch (Exception e){
                    e.printStackTrace();
                    returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
                }
            }
//        }else{
//            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
//            returnObject.setMessage("有重复音乐名");
//        }
        return  returnObject;
    }

    @RequestMapping("/admin/music/up.do")
    public @ResponseBody Object importMusicUp(String mid, MultipartFile music) throws IOException {
        ReturnObject returnObject=new ReturnObject();
        try {
            String filePath = System.getProperty("evan.webapp") + ("assets/music/") + mid +(".mp3");
            File file=new File(filePath);
            System.out.println(music.getName());
            music.transferTo(file);
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
        }catch (Exception e){
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("文件上传失败");
        }
        return  returnObject;
    }

    @RequestMapping("/album/music/list.do")
    public @ResponseBody Object selectMusicListByAlid(int alid) {
        List<Music> list = musicService.selectAlbumMusic(alid);
        int allRows = musicService.selectCountAlbumMusic(alid);
        Map<String, Object> reMap = new HashMap<>();
        reMap.put("allList", list);
        reMap.put("allRows", allRows);
        return reMap;
    }

    @RequestMapping("/album/music/selectImage.do")
    public @ResponseBody Object selectAlidByMid(int mid) {
        int alid = musicService.selectAlidByMid(mid);
        Map<String, Object> reMap = new HashMap<>();
        reMap.put("alid", alid);
        return reMap;
    }
}
