package com.ssm.service;

import com.ssm.pojo.Library;

import java.util.Map;

public interface LibraryService {
    Library selectByUid(int uid);
    int updateByPrimaryKeySelective(Library record);
    int selectReAlid(Library library);
    int updateLibraryDelByUid(Library library);
    int insert(int uid);
    void deleteLibrarysById(String[] id);
}
