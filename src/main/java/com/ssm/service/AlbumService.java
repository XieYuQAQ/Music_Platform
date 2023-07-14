package com.ssm.service;

import com.ssm.pojo.Album;
import com.ssm.pojo.Artist;

import java.util.List;
import java.util.Map;

public interface AlbumService {
    List<Album> selectAllAlbum(Map<String, Object> map);
    int selectCountAllAlbum(Map<String, Object> map);

    Album selectReAlbum(Map<String,Object> map);
    Album selectArtist(Map<String, Object> map);
    Album selectLabel(Map<String, Object> map);
    int insertAlbum(Album album);
    int selectAlidByName(Map<String, Object> map);

    int deleteAlbumById(String[] id);

    Album selectAlbumById(int alid);
    int selectReInAlbum(Map<String,Object> map);
    int updateAlbum(Album album);


    List<Album> selectAlbumByAid(int aid);
    int selectAlbumCountByAid(Map<String,Object> map);

    List<Album> selectLibraryAlbumByAlid(Map<String,Object> map);
    int selectLibraryAlbumCountByAlid(Map<String,Object> map);
    List<Album> selectLabelAlbum(Map<String,Object> map);
    int selectCountLabelAlbum(Map<String,Object> map);

    int selectAlidByTitle(String title);
}
