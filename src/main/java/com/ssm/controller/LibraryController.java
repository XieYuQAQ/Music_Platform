package com.ssm.controller;

import com.ssm.pojo.Album;
import com.ssm.pojo.Library;
import com.ssm.service.AlbumService;
import com.ssm.service.LibraryService;
import com.ssm.tools.ReturnObject;
import com.ssm.tools.contants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LibraryController {
    @Autowired
    LibraryService libraryService;

    @Autowired
    AlbumService albumService;

    @RequestMapping("/library.do")
    public @ResponseBody Object selectLibraryByUid(int uid,int pageNo,int pageSize){
        Library library = libraryService.selectByUid(uid);
        Map<String, Object> reMap = new HashMap<>();
        if(library == null){
            libraryService.insert(uid);
            library = libraryService.selectByUid(uid);
        }

        String check = library.getAlid();
        if(check.isEmpty()){
            reMap.put("allList", "");
            reMap.put("allRows", "");
        }else{
            Map<String, Object> map = new HashMap<>();
            map.put("alid", library.getAlid());
            map.put("beginNo", pageNo);
            map.put("pageSize", pageSize);
            List<Album> allList=albumService.selectLibraryAlbumByAlid(map);
            int allRows= albumService.selectLibraryAlbumCountByAlid(map);
            reMap.put("allList", allList);
            reMap.put("allRows", allRows);
        }
        return reMap;
    }
    @RequestMapping("/library/reCheck.do")
    public @ResponseBody Object reAlbum(int uid,Library library){
        ReturnObject returnObject=new ReturnObject();
        library.setUid(uid);
        int checkRe=libraryService.selectReAlid(library);
        if(checkRe==0){
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
        }else{
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
        }
        return returnObject;
    }
    @RequestMapping("/library/add.do")
    public @ResponseBody Object addLibrary(Library library){
        Library temp = libraryService.selectByUid(library.getUid());
        Map<String, Object> reMap = new HashMap<>();
        if(temp == null){
            libraryService.insert(library.getUid());
        }
        ReturnObject returnObject=new ReturnObject();
        String newAlbum = library.getAlid();
        Library getLibrary;
        getLibrary=libraryService.selectByUid(library.getUid());
        String check = getLibrary.getAlid();
        if(check.isEmpty()){
            libraryService.updateByPrimaryKeySelective(library);
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
            returnObject.setMessage("专辑添加成功");
        }else{
                //拼接alid
                String result=check+","+newAlbum;
                library.setAlid(result);
                libraryService.updateByPrimaryKeySelective(library);
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
                returnObject.setMessage("专辑添加成功");

        }
        return returnObject;
    }
    @RequestMapping("/library/del.do")
    public @ResponseBody Object delLibrary(Library library){
        ReturnObject returnObject=new ReturnObject();
        int check=libraryService.updateLibraryDelByUid(library);
        if(check==1){
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
        }else{
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
        }
        return returnObject;
    }
}
