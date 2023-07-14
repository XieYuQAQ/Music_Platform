package com.ssm.service.impl;

import com.ssm.mapper.LibraryMapper;
import com.ssm.pojo.Library;
import com.ssm.service.LibraryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("libraryService")
public class LibraryServiceImlp implements LibraryService {

    @Autowired
    private LibraryMapper libraryMapper;
    @Override
    public Library selectByUid(int uid){
        return libraryMapper.selectByUid(uid);
    }
    @Override
    public int updateByPrimaryKeySelective(Library record){
        return libraryMapper.updateByPrimaryKeySelective(record);
    }
    @Override
    public int selectReAlid(Library library){
        return libraryMapper.selectReAlid(library);
    }
    @Override
    public int updateLibraryDelByUid(Library library){
        return libraryMapper.updateLibraryDelByUid(library);
    }
    @Override
    public int insert(int uid){
        return libraryMapper.insert(uid);
    }
    @Override
    public void deleteLibrarysById(String[] id){
        libraryMapper.deleteLibrarysById(id);
    }
}
