package com.ssm.mapper;

import com.ssm.pojo.User;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component("userMapper")
public interface UserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table users
     *
     * @mbggenerated Fri Mar 10 09:12:39 CST 2023
     */
    int deleteByPrimaryKey(Integer uid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table users
     *
     * @mbggenerated Fri Mar 10 09:12:39 CST 2023
     */
    int insert(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table users
     *
     * @mbggenerated Fri Mar 10 09:12:39 CST 2023
     */
    int insertSelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table users
     *
     * @mbggenerated Fri Mar 10 09:12:39 CST 2023
     */
    User selectByPrimaryKey(Integer uid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table users
     *
     * @mbggenerated Fri Mar 10 09:12:39 CST 2023
     */
    int updateByPrimaryKeySelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table users
     *
     * @mbggenerated Fri Mar 10 09:12:39 CST 2023
     */
    int updateByPrimaryKey(User record);

    //用户注册
    int insertRegUsers(Map<String, Object> map);

    //登录页面 检查用户名密码
    User selectUserLogin(Map<String,Object> map);

    //后台 创建账户
    //创建账户需要先查询用户名和邮箱
    User selectUserNameAndMail(Map<String,Object> map);
    //然后检查无重复后向数据库添加用户
    int insertUsers(User user);

    //后台 列出所有符合条件的账户
    List<User> selectAllUsers(Map<String,Object> map);
    //总条数
    int selectCountAllUsers(Map<String,Object> map);

    int selectReUser(Map<String,Object> map);
    //后台 删除用户
    int deleteUsersById(String[] id);

    //后台 修改用户
    //根据id查询
    User selectUserById(int uid);
    //更新用户
    int updateUser(User user);


    //以下为用户设置页面相关功能
    int updateScreenName(User user);
    int updatePassword(User user);
}