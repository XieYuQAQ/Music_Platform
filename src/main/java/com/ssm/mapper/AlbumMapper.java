package com.ssm.mapper;

import com.ssm.pojo.Album;
import com.ssm.pojo.Artist;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component("albumMapper")
public interface AlbumMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table album
     *
     * @mbggenerated Mon Mar 13 13:37:35 CST 2023
     */
    int deleteByPrimaryKey(Integer alid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table album
     *
     * @mbggenerated Mon Mar 13 13:37:35 CST 2023
     */
    int insert(Album record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table album
     *
     * @mbggenerated Mon Mar 13 13:37:35 CST 2023
     */
    int insertSelective(Album record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table album
     *
     * @mbggenerated Mon Mar 13 13:37:35 CST 2023
     */
    Album selectByPrimaryKey(Integer alid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table album
     *
     * @mbggenerated Mon Mar 13 13:37:35 CST 2023
     */
    int updateByPrimaryKeySelective(Album record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table album
     *
     * @mbggenerated Mon Mar 13 13:37:35 CST 2023
     */
    int updateByPrimaryKeyWithBLOBs(Album record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table album
     *
     * @mbggenerated Mon Mar 13 13:37:35 CST 2023
     */
    int updateByPrimaryKey(Album record);

    //后台 列出所有符合条件的
    List<Album> selectAllAlbum(Map<String,Object> map);
    //总条数
    int selectCountAllAlbum(Map<String,Object> map);

    //增加
    //查重
    Album selectReAlbum(Map<String, Object> map);
    Album selectArtist(Map<String, Object> map);
    Album selectLabel(Map<String, Object> map);
    int insertAlbum(Album album);
    int selectAlidByName(Map<String, Object> map);

    //删除
    int deleteAlbumById(String[] id);

    //修改
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