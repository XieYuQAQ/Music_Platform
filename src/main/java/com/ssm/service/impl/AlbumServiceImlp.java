package com.ssm.service.impl;

import com.ssm.mapper.AlbumMapper;
import com.ssm.pojo.Album;
import com.ssm.pojo.Artist;
import com.ssm.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("albumService")
public class AlbumServiceImlp implements AlbumService {

    @Autowired
    private AlbumMapper albumMapper;

    @Override
    public List<Album> selectAllAlbum(Map<String, Object> map){
        return albumMapper.selectAllAlbum(map);
    }
    @Override
    public int selectCountAllAlbum(Map<String, Object> map){
        return albumMapper.selectCountAllAlbum(map);
    }
    @Override
    public Album selectReAlbum(Map<String,Object> map){
        return albumMapper.selectReAlbum(map);
    }
    @Override
    public Album selectArtist(Map<String, Object> map){
        return albumMapper.selectArtist(map);
    }
    @Override
    public Album selectLabel(Map<String, Object> map){
        return albumMapper.selectLabel(map);
    }
    @Override
    public int insertAlbum(Album album){
        return albumMapper.insertAlbum(album);
    }
    @Override
    public int selectAlidByName(Map<String, Object> map){
        return albumMapper.selectAlidByName(map);
    }

    @Override
    public int deleteAlbumById(String[] id){
        return albumMapper.deleteAlbumById(id);
    }

    @Override
    public Album selectAlbumById(int alid) {
        return albumMapper.selectAlbumById(alid);
    }
    @Override
    public int selectReInAlbum(Map<String, Object> map){
        return albumMapper.selectReInAlbum(map);
    }
    @Override
    public int updateAlbum(Album album) {
        return albumMapper.updateAlbum(album);
    }

    @Override
    public List<Album> selectAlbumByAid(int aid){
        return albumMapper.selectAlbumByAid(aid);
    }
    @Override
    public int selectAlbumCountByAid(Map<String,Object> map){
        return albumMapper.selectAlbumCountByAid(map);
    }
    @Override
    public List<Album> selectLibraryAlbumByAlid(Map<String,Object> map){
        return albumMapper.selectLibraryAlbumByAlid(map);
    }

    @Override
    public int selectLibraryAlbumCountByAlid(Map<String,Object> map){
        return albumMapper.selectLibraryAlbumCountByAlid(map);
    }
    @Override
    public List<Album> selectLabelAlbum(Map<String,Object> map){
        return albumMapper.selectLabelAlbum(map);
    }
    @Override
    public int selectCountLabelAlbum(Map<String,Object> map){
        return albumMapper.selectCountLabelAlbum(map);
    }

    @Override
    public int selectAlidByTitle(String title){
        return albumMapper.selectAlidByTitle(title);
    }
}
