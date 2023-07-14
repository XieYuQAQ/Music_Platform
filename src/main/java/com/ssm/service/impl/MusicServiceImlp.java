package com.ssm.service.impl;

import com.ssm.mapper.MusicMapper;
import com.ssm.pojo.Music;
import com.ssm.service.MusicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("musicService")
public class MusicServiceImlp implements MusicService {

    @Autowired
    private MusicMapper musicMapper;

    @Override
    public List<Music> selectAllMusic(Map<String,Object> map){
        return musicMapper.selectAllMusic(map);
    }
    @Override
    public int selectCountAllMusic(Map<String,Object> map){
        return musicMapper.selectCountAllMusic(map);
    }

    @Override
    public Music selectReMusic(Map<String, Object> map){
        return musicMapper.selectReMusic(map);
    }
    @Override
    public Music selectAlid(Map<String, Object> map){
        return musicMapper.selectAlid(map);
    }
    @Override
    public int insertMusic(Music music){
        return musicMapper.insertMusic(music);
    }

    @Override
    public int deleteMusicById(String[] id){
        return musicMapper.deleteMusicById(id);
    }

    @Override
    public Music selectMusicById(int mid){
        return musicMapper.selectMusicById(mid);
    }
    @Override
    public int selectReInMusic(Map<String,Object> map){
        return musicMapper.selectReInMusic(map);
    }
    @Override
    public int updateMusic(Music music){
        return musicMapper.updateMusic(music);
    }
    @Override
    public List<Music> selectAlbumMusic(int alid) {
        return musicMapper.selectAlbumMusic(alid);
    }
    @Override
    public int selectCountAlbumMusic(int alid) {
        return musicMapper.selectCountAlbumMusic(alid);
    }
    @Override
    public int selectAlidByMid(int mid){
        return musicMapper.selectAlidByMid(mid);
    }

    @Override
    public int selectMidByName(Music music){
        return musicMapper.selectMidByName(music);
    }
}
