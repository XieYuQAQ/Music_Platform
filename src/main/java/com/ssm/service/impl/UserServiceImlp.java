package com.ssm.service.impl;

import com.ssm.mapper.UserMapper;
import com.ssm.pojo.User;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("userService")
public class UserServiceImlp implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public int insertRegUsers(Map<String, Object> map){
        return userMapper.insertRegUsers(map);
    }

    @Override
    public User selectUserLogin(Map<String, Object> map) {
        return userMapper.selectUserLogin(map);
    }

    @Override
    public int insertUsers(User user){
        return userMapper.insertUsers(user);
    }
    @Override
    public User selectUserNameAndMail(Map<String, Object> map) {
        return userMapper.selectUserNameAndMail(map);
    }

    @Override
    public List<User> selectALLUsers(Map<String, Object> map){
        return userMapper.selectAllUsers(map);
    }
    @Override
    public int selectCountAllUsers(Map<String, Object> map){
        return userMapper.selectCountAllUsers(map);
    }

    @Override
    public int deleteUsersById(String[] id){
        return userMapper.deleteUsersById(id);
    }

    @Override
    public User selectUserById(int uid){
        return userMapper.selectUserById(uid);
    }

    @Override
    public int updateUser(User user){
        return userMapper.updateUser(user);
    }
    @Override
    public int selectReUser(Map<String,Object> map){
        return userMapper.selectReUser(map);
    }

    @Override
    public int updateScreenName(User user) {
        return userMapper.updateScreenName(user);
    }
    @Override
    public int updatePassword(User user){
        return userMapper.updatePassword(user);
    }
}
