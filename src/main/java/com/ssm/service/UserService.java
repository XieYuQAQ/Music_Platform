package com.ssm.service;
import com.ssm.pojo.User;

import java.util.List;
import java.util.Map;
public interface UserService {


    int insertRegUsers(Map<String, Object> map);
    //登录 验证账户
    User selectUserLogin(Map<String, Object> map);

    //后台 添加账户
    int insertUsers(User user);
    User selectUserNameAndMail(Map<String, Object> map);

    //列出条件账户
    List<User> selectALLUsers(Map<String, Object> map);
    int selectCountAllUsers(Map<String, Object> map);

    int deleteUsersById(String[] id);

    User selectUserById(int uid);

    int updateUser(User user);

    int selectReUser(Map<String,Object> map);




    int updateScreenName(User user);
    int updatePassword(User user);
}
