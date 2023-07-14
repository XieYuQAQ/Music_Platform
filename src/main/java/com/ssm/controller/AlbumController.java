package com.ssm.controller;

import com.ssm.pojo.Album;
import com.ssm.service.AlbumService;
import com.ssm.tools.ReturnObject;
import com.ssm.tools.contants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AlbumController {

    @Autowired
    AlbumService albumService;


    @RequestMapping("/admin/album")
    public String pageAlbum(){
        //转跳
        return "admin/manage_album";
    }

    @RequestMapping("/admin/album/list.do")
    public @ResponseBody Object selectAllLabel(String name, Integer pageNo, Integer pageSize) {
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        pageNo=(pageNo-1)*pageSize;
        map.put("beginNo", pageNo);
        map.put("pageSize", pageSize);
        List<Album> albumList = albumService.selectAllAlbum(map);
        int albumRows = albumService.selectCountAllAlbum(map);
        Map<String, Object> reMap = new HashMap<>();
        reMap.put("allList", albumList);
        reMap.put("allRows", albumRows);
        return reMap;
    }

    @RequestMapping("/admin/album/add")
    public String pageAdd(){
        //转跳到添加
        return "admin/manage_album_add";
    }

    @RequestMapping("/admin/album/add.do")
    public @ResponseBody Object insertAlbum(Album album){
        Map<String,Object> map=new HashMap<>();
        map.put("title",album.getTitle());
        Album check=albumService.selectReAlbum(map);
        ReturnObject returnObject=new ReturnObject();
        if(check==null){
            //returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
            //查询艺人
            map.put("artists",album.getArtists());
            check=albumService.selectArtist(map);
            if (check==null){
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
                returnObject.setMessage("没有找到相关艺人，请检查");
            }else{
                //在album中放入aid
                album.setAid(check.getAid());
                //查询标签
                map.put("label",album.getLabel());
                check=albumService.selectLabel(map);
                if (check==null){
                    returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
                    returnObject.setMessage("没有找到标签，请检查");
                }else{
                    album.setLid(check.getLid());
                    albumService.insertAlbum(album);
                    int tempAlid=albumService.selectAlidByTitle(album.getTitle());
                    returnObject.setReturnData(tempAlid);
                    returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
                }
            }
        }else{
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("有重复专辑名");
        }
        return returnObject;
    }

    @RequestMapping("/admin/album/del.do")
    public @ResponseBody Object deleteAlbumById(String[] id){
        ReturnObject returnObject=new ReturnObject();
        try{
            int ret = albumService.deleteAlbumById(id);
            if(ret>0){
                //循环删除
                for(int tempNum=0;tempNum < id.length;tempNum++){
                    String filePath = System.getProperty("evan.webapp") + ("assets/images/album/") + id[tempNum] +(".jpg");
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
            }else {
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return returnObject;
        }

    @RequestMapping("/admin/album/edit")
    public String pageEdit(){
        //转跳到修改
        return "admin/manage_album_edit";
    }

    @RequestMapping("/admin/album/edit.do")
    public @ResponseBody Object selectAlbumById(int alid){
        Album album=albumService.selectAlbumById(alid);
        return album;
    }
    @RequestMapping("/admin/album/useedit.do")
    public @ResponseBody Object updateAlbum(Album album){
        ReturnObject returnObject=new ReturnObject();
        Map<String,Object> map=new HashMap<>();
        map.put("title",album.getTitle());
        map.put("alid",album.getAlid());
        Album check;
        int check_retitle=albumService.selectReInAlbum(map);
        if(check_retitle==0){
            //returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
            //查询艺人
            map.put("artists",album.getArtists());
            check=albumService.selectArtist(map);
            if (check==null){
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
                returnObject.setMessage("没有找到相关艺人，请检查");
            }else{
                //在album中放入aid
                album.setAid(check.getAid());
                //查询标签
                map.put("label",album.getLabel());
                check=albumService.selectLabel(map);
                if (check==null){
                    returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
                    returnObject.setMessage("没有找到标签，请检查");
                }else{
                    album.setLid(check.getLid());
                    try{
                        int ret=albumService.updateAlbum(album);
                        if(ret > 0){
                            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
                        }else{
                            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
                        }
                    }catch (Exception e){
                        e.printStackTrace();
                        returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
                    }
                    returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
                }
            }
        }else{
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("有重复专辑名");
        }
        return  returnObject;
    }

    @RequestMapping("/admin/album/image.do")
    public @ResponseBody Object importAlbumImage(String alid, MultipartFile image) throws IOException {
        ReturnObject returnObject=new ReturnObject();
        try {
            String filePath = System.getProperty("evan.webapp") + ("assets/images/album/") + alid +(".jpg");
            File file=new File(filePath);
            System.out.println(image.getName());
            image.transferTo(file);
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
        }catch (Exception e){
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("文件上传失败");
        }
        return  returnObject;
    }

    @RequestMapping("/album/list.do")
    public @ResponseBody Object selectIndexAlbum(String name,Integer pageNo,Integer pageSize) {
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        map.put("beginNo", pageNo);
        map.put("pageSize", pageSize);
        List<Album> albumList = albumService.selectAllAlbum(map);
        int allRows = albumService.selectCountAllAlbum(map);
        Map<String, Object> reMap = new HashMap<>();
        reMap.put("allRows",allRows);
        reMap.put("allList", albumList);
        return reMap;
    }

    @RequestMapping("/album/info")
    public String pageAlbumInfo(){
        //转跳到添加
        return "albumInfo";
    }
    @RequestMapping("/album/info.do")
    public @ResponseBody Object selectAlbumInfoById(int alid){
        Album album=albumService.selectAlbumById(alid);
        return album;
    }

    @RequestMapping("/album/artist.do")
    public @ResponseBody Object selectAlbumInfoByAid(int aid){
        Map<String, Object> map = new HashMap<>();
        List<Album> albumList = albumService.selectAlbumByAid(aid);
        map.put("aid", aid);
        int albumRows = albumService.selectAlbumCountByAid(map);
        Map<String, Object> reMap = new HashMap<>();
        reMap.put("allList", albumList);
        reMap.put("allRows", albumRows);
        return reMap;
    }

    @RequestMapping("/label/album.do")
    public @ResponseBody Object selectLabelAlbum(Integer lid,Integer pageNo,Integer pageSize) {
        Map<String, Object> map = new HashMap<>();
        map.put("lid", lid);
        map.put("beginNo", pageNo);
        map.put("pageSize", pageSize);
        List<Album> albumList = albumService.selectLabelAlbum(map);
        int allRows = albumService.selectCountLabelAlbum(map);
        Map<String, Object> reMap = new HashMap<>();
        reMap.put("allRows",allRows);
        reMap.put("allList", albumList);
        return reMap;
    }
}
