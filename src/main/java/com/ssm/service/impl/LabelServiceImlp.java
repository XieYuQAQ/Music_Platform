package com.ssm.service.impl;

import com.ssm.mapper.LabelMapper;
import com.ssm.pojo.Label;
import com.ssm.service.LabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("labelService")
public class LabelServiceImlp implements LabelService {

    @Autowired
    private LabelMapper labelMapper;
    @Override
    public List<Label> selectAllLabel(Map<String, Object> map){
        return labelMapper.selectAllLabel(map);
    }
    @Override
    public int selectCountAllLabel(Map<String, Object> map){
        return labelMapper.selectCountAllLabel(map);
    }
    @Override
    public Label selectReLabel(Map<String,Object> map) {
        return labelMapper.selectReLabel(map);
    }
    @Override
    public int insertLabel(Label label){
        return labelMapper.insertLabel(label);
    }

    @Override
    public int deleteLabelById(String[] id){
        return labelMapper.deleteLabelById(id);
    }
    @Override
    public Label selectLabelById(int lid){
        return labelMapper.selectLabelById(lid);
    }
    @Override
    public int updateLabel(Label label){
        return labelMapper.updateLabel(label);
    }
    @Override
    public int selectReInLabel(Map<String,Object> map){
        return labelMapper.selectReInLabel(map);
    }

}
