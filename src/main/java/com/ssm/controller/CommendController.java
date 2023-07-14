package com.ssm.controller;

import com.ssm.pojo.Artist;
import com.ssm.pojo.Commend;
import com.ssm.service.CommendService;
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
public class CommendController {
    @Autowired
    CommendService commendService;

    @RequestMapping("admin/commend")
    public String pageCommend(){
        //转发请求
        return("admin/manage_commend");
    }
    @RequestMapping("admin/commend/add")
    public String pageAdd(){
        //转发请求
        return("admin/manage_commend_add");
    }
    @RequestMapping("admin/commend/edit")
    public String pageEdit(){
        //转发请求
        return("admin/manage_commend_edit");
    }

    @RequestMapping("/admin/commend/list.do")
    public @ResponseBody Object selectAllCommend(String name, Integer pageNo, Integer pageSize){
        Map<String, Object> map = new HashMap<>();
        map.put("name",name);
        pageNo = 0;
        map.put("beginNo",pageNo);
        pageSize = 10;
        map.put("pageSize", pageSize);
        List<Commend> commendList = commendService.selectAllCommend(map);
        int allRows = commendService.selectCountAllCommend(map);
        Map<String, Object> reMap = new HashMap<>();
        reMap.put("allList", commendList);
        reMap.put("allRows", allRows);
        return reMap;
    }

    @RequestMapping("/admin/commend/add.do")
    public @ResponseBody Object insertCommend(Commend commend){
        Map<String,Object> map=new HashMap<>();
        map.put("album",commend.getAlbum());
        Commend check=commendService.selectAlidByName(map);
        ReturnObject returnObject=new ReturnObject();
        if(check==null){
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("查找不到相关专辑");
        }else{
            commend.setAlid(check.getAlid());
            commendService.insertCommend(commend);
            returnObject.setReturnData(commendService.selectIdByName(commend));
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
        }
        return returnObject;
    }

    @RequestMapping("/admin/commend/del.do")
    public @ResponseBody Object deleteCommendById(String[] id){
        ReturnObject returnObject=new ReturnObject();
        try{
            int ret = commendService.deleteCommendById(id);
            if(ret>0){
                //循环删除
                for(int tempNum=0;tempNum < id.length;tempNum++){
                    String filePath = System.getProperty("evan.webapp") + ("assets/images/commend/") + id[tempNum] +(".jpg");
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
    @RequestMapping("/admin/commend/edit.do")
    public @ResponseBody Object selectCommendById(int id){
        Commend commend=commendService.selectCommendById(id);
        return commend;
    }

    @RequestMapping("/admin/commend/useedit.do")
    public @ResponseBody Object updateCommend(Commend commend){
        ReturnObject returnObject=new ReturnObject();
        Map<String,Object> map=new HashMap<>();
        map.put("album",commend.getAlbum());
        Commend check=commendService.selectAlidByName(map);
        if(check==null){
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("没有找到相关专辑");
        }else{
            commend.setAlid(check.getAlid());
            try{
                int ret=commendService.updateCommend(commend);
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
        return  returnObject;
    }

    @RequestMapping("/admin/commend/image.do")
    public @ResponseBody Object importCommendImage(String id, MultipartFile image) throws IOException {
        ReturnObject returnObject=new ReturnObject();
        try {
            String filePath = System.getProperty("evan.webapp") + ("assets/images/commend/") + id +(".jpg");
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

    @RequestMapping("/commend/list.do")
    public @ResponseBody Object selectIndexCommend(){
        Map<String, Object> map = new HashMap<>();
        map.put("name","");
        Integer pageNo;
        Integer pageSize;
        pageNo = 0;
        map.put("beginNo",pageNo);
        pageSize = 3;
        map.put("pageSize", pageSize);
        List<Commend> commendList = commendService.selectAllCommend(map);
        Map<String, Object> reMap = new HashMap<>();
        reMap.put("allList", commendList);
        return reMap;
    }
}
