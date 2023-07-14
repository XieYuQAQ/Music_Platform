package com.ssm.service;

import com.ssm.pojo.Commend;

import java.util.List;
import java.util.Map;

public interface CommendService {

    //后台 列出所有符合条件的
    List<Commend> selectAllCommend(Map<String,Object> map);
    //总条数
    int selectCountAllCommend(Map<String,Object> map);

    //增加
    //查重
    Commend selectReCommend(Map<String, Object> map);
    Commend selectAlidByName(Map<String, Object> map);
    int insertCommend(Commend commend);

    //删除
    int deleteCommendById(String[] id);

    //修改
    Commend selectCommendById(int id);
    int updateCommend(Commend Commend);

    int selectIdByName(Commend commend);
}
