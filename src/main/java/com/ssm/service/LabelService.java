package com.ssm.service;

import com.ssm.pojo.Label;
import com.ssm.pojo.User;

import java.util.List;
import java.util.Map;

public interface LabelService {

    List<Label> selectAllLabel(Map<String, Object> map);
    int selectCountAllLabel(Map<String, Object> map);

    Label selectReLabel(Map<String,Object> map);
    int insertLabel(Label label);

    int deleteLabelById(String[] id);

    Label selectLabelById(int lid);
    int updateLabel(Label label);
    int selectReInLabel(Map<String,Object> map);
}
