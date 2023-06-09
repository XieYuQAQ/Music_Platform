package com.ssm.mapper;

import com.ssm.pojo.Library;
import org.springframework.stereotype.Component;

import java.util.Map;
@Component("libraryMapper")
public interface LibraryMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table library
     *
     * @mbggenerated Thu Mar 23 17:43:20 CST 2023
     */
    int deleteByPrimaryKey(Integer uid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table library
     *
     * @mbggenerated Thu Mar 23 17:43:20 CST 2023
     */
    int insert(Library record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table library
     *
     * @mbggenerated Thu Mar 23 17:43:20 CST 2023
     */
    int insertSelective(Library record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table library
     *
     * @mbggenerated Thu Mar 23 17:43:20 CST 2023
     */
    Library selectByPrimaryKey(Integer uid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table library
     *
     * @mbggenerated Thu Mar 23 17:43:20 CST 2023
     */
    int updateByPrimaryKeySelective(Library record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table library
     *
     * @mbggenerated Thu Mar 23 17:43:20 CST 2023
     */
    int updateByPrimaryKeyWithBLOBs(Library record);

    Library selectByUid(int uid);

    int selectReAlid(Library library);

    int updateLibraryDelByUid(Library library);
    int insert(int uid);
    void deleteLibrarysById(String[] id);
}