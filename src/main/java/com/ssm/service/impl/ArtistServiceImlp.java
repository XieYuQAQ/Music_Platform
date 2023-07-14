package com.ssm.service.impl;

import com.ssm.mapper.ArtistMapper;
import com.ssm.pojo.Artist;
import com.ssm.pojo.Label;
import com.ssm.service.ArtistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("artistService")
public class ArtistServiceImlp implements ArtistService {
    @Autowired
    private ArtistMapper artistMapper;
    @Override
    public List<Artist> selectAllArtist(Map<String,Object> map){
        return artistMapper.selectAllArtist(map);
    }
    @Override
    public int selectCountAllArtist(Map<String,Object> map){
        return artistMapper.selectCountAllArtist(map);
    }
    @Override
    public Artist selectReArtist(Map<String,Object> map){
        return artistMapper.selectReArtist(map);
    }
    @Override
    public int insertArtist(Artist artist){
        return artistMapper.insertArtist(artist);
    }
    @Override
    public int deleteArtistById(String[] id){
        return artistMapper.deleteArtistById(id);
    }
    @Override
    public Artist selectArtistById(int lid){
        return artistMapper.selectArtistById(lid);
    }
    @Override
    public int updateArtist(Artist artist){
        return artistMapper.updateArtist(artist);
    }
    @Override
    public int selectReInArtist(Map<String,Object> map) {
        return artistMapper.selectReInArtist(map);
    }

    @Override
    public int selectaidByName(String name){
        return artistMapper.selectaidByName(name);
    }
}
