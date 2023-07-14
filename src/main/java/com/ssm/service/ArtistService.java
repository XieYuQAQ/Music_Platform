package com.ssm.service;

import com.ssm.pojo.Artist;
import com.ssm.pojo.Label;

import java.util.List;
import java.util.Map;

public interface ArtistService {
    List<Artist> selectAllArtist(Map<String,Object> map);
    int selectCountAllArtist(Map<String,Object> map);

    Artist selectReArtist(Map<String,Object> map);
    int insertArtist(Artist artist);

    int deleteArtistById(String[] id);

    Artist selectArtistById(int lid);
    int updateArtist(Artist artist);
    int selectReInArtist(Map<String,Object> map);
    int selectaidByName(String name);
}
