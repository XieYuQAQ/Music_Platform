package com.ssm.controller;

import com.ssm.pojo.Label;
import com.ssm.service.LabelService;
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
public class LabelController {

    @Autowired
    LabelService labelService;

    @RequestMapping("/admin/label")
    public String pageArtist(){
        return "admin/manage_label";
    }

    @RequestMapping("/admin/label/list.do")
    public @ResponseBody Object selectAllLabel(String name,Integer pageNo,Integer pageSize) {
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        pageNo=(pageNo-1)*pageSize;
        map.put("beginNo", pageNo);
        map.put("pageSize", pageSize);
        List<Label> labelList = labelService.selectAllLabel(map);
        int labelRows = labelService.selectCountAllLabel(map);
        Map<String, Object> reMap = new HashMap<>();
        reMap.put("labelList", labelList);
        reMap.put("labelRows", labelRows);
        return reMap;
    }

    @RequestMapping("/admin/label/add")
    public String pageAdd(){
        return "admin/manage_label_add";
    }

    @RequestMapping("/admin/label/add.do")
    public @ResponseBody Object insertLabel(Label label){
        Map<String,Object> map=new HashMap<>();
        map.put("name",label.getName());
        Label labelcheck=labelService.selectReLabel(map);
        ReturnObject returnObject=new ReturnObject();
        if(labelcheck==null){
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
            labelService.insertLabel(label);
        }else{
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("有重复标签");
        }
        return returnObject;
    }

    @RequestMapping("/admin/label/del.do")
    public @ResponseBody Object deleteLabelById(String[] id){
        ReturnObject returnObject=new ReturnObject();
        try{
            int ret = labelService.deleteLabelById(id);
            if(ret>0){
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
            }else {
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return returnObject;
    }

    @RequestMapping("/admin/label/edit")
    public String pageEdit(){
        return "admin/manage_label_edit";
    }

    @RequestMapping("/admin/label/edit.do")
    public @ResponseBody Object selectLabelById(int lid){
        Label label=labelService.selectLabelById(lid);
        return label;
    }
    @RequestMapping("/admin/label/useedit.do")
    public @ResponseBody Object updateUser(Label label){
        ReturnObject returnObject=new ReturnObject();
        Map<String,Object> map=new HashMap<>();
        map.put("name",label.getName());
        map.put("lid",label.getLid());
        int check=labelService.selectReInLabel(map);
        if(check==0){
            try{
                int ret=labelService.updateLabel(label);
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

    @RequestMapping("/label/list.do")
    public @ResponseBody Object listAllLabel(Integer pageNo,Integer pageSize) {
        Map<String, Object> map = new HashMap<>();
        map.put("name", "");
        pageNo=(pageNo-1)*pageSize;
        map.put("beginNo", pageNo);
        map.put("pageSize", pageSize);
        List<Label> allList = labelService.selectAllLabel(map);
        int allRows = labelService.selectCountAllLabel(map);
        Map<String, Object> reMap = new HashMap<>();
        reMap.put("allList", allList);
        reMap.put("allRows", allRows);
        return reMap;
    }
}
