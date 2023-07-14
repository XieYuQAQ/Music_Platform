package com.ssm.service;

import com.ssm.pojo.Music;

import java.util.List;
import java.util.Map;

public interface MusicService {

    List<Music> selectAllMusic(Map<String,Object> map);
    int selectCountAllMusic(Map<String,Object> map);

    Music selectReMusic(Map<String, Object> map);
    Music selectAlid(Map<String, Object> map);
    int insertMusic(Music music);

    int deleteMusicById(String[] id);

    Music selectMusicById(int mid);
    int selectReInMusic(Map<String,Object> map);
    int updateMusic(Music music);

    List<Music> selectAlbumMusic(int alid);
    int selectCountAlbumMusic(int alid);

    int selectAlidByMid(int mid);
    int selectMidByName(Music music);
}
