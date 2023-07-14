package com.ssm.service.impl;

import com.ssm.mapper.CommendMapper;
import com.ssm.pojo.Commend;
import com.ssm.service.CommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("commendService")
public class CommendServiceImlp implements CommendService {
    
    @Autowired
    private CommendMapper commendMapper;


    //后台 列出所有符合条件的
    @Override
    public List<Commend> selectAllCommend(Map<String,Object> map){
        return commendMapper.selectAllCommend(map);
    }
    //总条数
    @Override
    public int selectCountAllCommend(Map<String,Object> map){
        return commendMapper.selectCountAllCommend(map);
    }

    //增加
    //查重
    @Override
    public Commend selectReCommend(Map<String, Object> map){
        return commendMapper.selectReCommend(map);
    }
    @Override
    public Commend selectAlidByName(Map<String, Object> map){
        return commendMapper.selectAlidByName(map);
    }
    @Override
    public int insertCommend(Commend commend){
        return commendMapper.insertCommend(commend);
    }

    //删除
    @Override
    public int deleteCommendById(String[] id){
        return commendMapper.deleteCommendById(id);
    }

    //修改
    @Override
    public Commend selectCommendById(int id){
        return commendMapper.selectCommendById(id);
    }
    @Override
    public int updateCommend(Commend commend){
        return commendMapper.updateCommend(commend);
    }

    @Override
    public int selectIdByName(Commend commend){
        return commendMapper.selectIdByName(commend);
    }
}
