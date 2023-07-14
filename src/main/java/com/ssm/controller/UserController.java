package com.ssm.controller;

import com.ssm.pojo.User;
import com.ssm.service.LibraryService;
import com.ssm.service.UserService;
import com.ssm.tools.Base64ToMultipartFile;
import com.ssm.tools.AppMD5;
import com.ssm.tools.ReturnObject;
import com.ssm.tools.contants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//用于后台页面的转跳
@Controller
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    LibraryService libraryService;

    //用户注册
    @RequestMapping("/login/reg.do")
    public @ResponseBody Object reg(String mail,String name,String password){
        Map<String,Object> map=new HashMap<>();
        map.put("mail",mail);
        map.put("name",name);
        map.put("password", AppMD5.getMD5(password));
        ReturnObject returnObject=new ReturnObject();
        User usertest=userService.selectUserNameAndMail(map);
        if(usertest==null){
            userService.insertRegUsers(map);
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
        }else{
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("有重复用户，请检查用户名和邮箱");
        }
        return returnObject;
    }

    //登录验证
    @RequestMapping("/login/login_check.do")
    public @ResponseBody Object loginCheck(String name, String password, HttpSession session){
        //封装参数
        Map<String,Object> map=new HashMap<>();
        map.put("name",name);
        map.put("password", AppMD5.getMD5(password));
        //调用service方法
        User user=userService.selectUserLogin(map);
        ReturnObject returnObject=new ReturnObject();
        //根据查询结果响应
        if(user==null){
            //登录失败，用户名或者密码错误
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("用户名或者密码错误");
        }else{
            //登录成功
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
            //获取用户session
            session.setAttribute(contants.USER_SESSION,user);
        }
        return returnObject;
    }

    //账户退出
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        //清空Cookie
        session.invalidate();
        return "redirect:/";
    }

    //账户退出
    @RequestMapping("/infoLogout")
    public String infoLogout(HttpSession session){
        //清空Cookie
        session.invalidate();
        return "redirect:news";
    }



    //后台管理用户
    //添加用户
    //添加用户页面
    @RequestMapping("/admin/users/add")
    public String pageAdd(){
        //转跳到添加用户页面
        return "admin/manage_users_add";
    }

    @RequestMapping("/admin/users/add.do")
    public @ResponseBody Object insertUsers(User user){
        Map<String,Object> map=new HashMap<>();
        map.put("name",user.getName());
        map.put("mail",user.getMail());
        User usertest=userService.selectUserNameAndMail(map);
        ReturnObject returnObject=new ReturnObject();
        if(usertest==null){
            //检查没有重复用户名和邮箱后，先对密码进行MD5加密
            user.setPassword(AppMD5.getMD5(user.getPassword()));
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
            userService.insertUsers(user);
        }else{
            //有重复用户，禁止添加
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("有重复用户，请检查用户名和邮箱");
        }
        return returnObject;
    }

    @RequestMapping("/admin/users/list.do")
    public @ResponseBody Object selectAllUsers(String name,Integer pageNo,Integer pageSize){
        Map<String,Object> map=new HashMap<>();
        map.put("name", name);
        pageNo=(pageNo-1)*pageSize;
        map.put("beginNo", pageNo);
        map.put("pageSize", pageSize);
        //查询数据
        List<User> usersList=userService.selectALLUsers(map);
        int usersRows=userService.selectCountAllUsers(map);
        //生成响应信息
        Map<String,Object> reMap=new HashMap<>();
        reMap.put("usersList",usersList);
        reMap.put("usersRows",usersRows);
        return reMap;
    }

    @RequestMapping("/admin/users/del.do")
    public @ResponseBody Object deleteUsersById(String[] id){
        ReturnObject returnObject=new ReturnObject();
        try{
            int ret = userService.deleteUsersById(id);
            libraryService.deleteLibrarysById(id);
            if(ret>0){
                //循环删除
                for(int tempNum=0;tempNum < id.length;tempNum++){
                    String filePath = System.getProperty("evan.webapp") + ("assets/images/users/") + id[tempNum] +(".jpg");
                    File delFile = new File(filePath);
                    if(delFile.isFile() && delFile.exists()) {
                        delFile.delete();
                        //如果有则删除
                        returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
                    }else {
                        //这里是找不到文件，但也无所谓，毕竟用户已经删除，对应编号也没有上传图片，不用管，报成功就行
                        returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
                    }
                }
            }else {
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return returnObject;
    }

    //编辑用户页面
    @RequestMapping("/admin/users/edit")
    public String pageEdit(){
        //转跳到编辑用户页面
        return "admin/manage_users_edit";
    }
    @RequestMapping("/admin/users/edit.do")
    public @ResponseBody Object selectUserById(int uid){
        User user=userService.selectUserById(uid);
        return user;
    }

    @RequestMapping("/admin/users/useedit.do")
    public @ResponseBody Object updateUser(User user){
        ReturnObject returnObject=new ReturnObject();
        Map<String,Object> map=new HashMap<>();
        map.put("name",user.getName());
        map.put("uid",user.getUid());
        int check=userService.selectReUser(map);
        if(check==0){
            try{
                user.setPassword(AppMD5.getMD5(user.getPassword()));
                int ret=userService.updateUser(user);
                if(ret > 0){
                    returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
                }else{
                    returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
                }
            }catch (Exception e){
                e.printStackTrace();
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            }
        }else{
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("有重复用户名");
        }
        return  returnObject;
    }

    @RequestMapping("/admin/users/image.do")
    public @ResponseBody Object importUsersImage(String uid, String base64) throws IOException {
        final String[] base64Array = base64.split(",");
        String dataUir, data;
        if (base64Array.length > 1) {
            dataUir = base64Array[0];
            data = base64Array[1];
        } else {
            //根据你base64代表的具体文件构建
            dataUir = "data:image/jpg;base64";
            data = base64Array[0];
        }
        MultipartFile image = new Base64ToMultipartFile(data, dataUir);
        ReturnObject returnObject=new ReturnObject();
        try {
            String filePath = System.getProperty("evan.webapp") + ("assets/images/users/") + uid +(".jpg");
            File file=new File(filePath);
            System.out.println(image.getName());
            image.transferTo(file);
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
        }catch (Exception e){
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("文件上传失败");
        }
        return  returnObject;
    }

    //以下为账户设置相关
    // account-settings
    //转跳到账户设置页面
    @RequestMapping("/account/settings")
    public String acSet(){
        //转跳到添加用户页面
        return "/account/settings";
    }
    //转跳到账户昵称修改页面
    @RequestMapping("/account/settings/screenNameEdit")
    public String snEdit(){
        //转跳到添加用户页面
        return "/account/screenNameEdit";
    }
    //昵称修改提交
    @RequestMapping("/account/settings/screenNameEdit.do")
    public @ResponseBody Object updateScreenName(User user, HttpSession session){
        ReturnObject returnObject=new ReturnObject();
        Map<String,Object> map=new HashMap<>();
        map.put("screenName",user.getScreenname());
        map.put("uid",user.getUid());
        try{
            int ret=userService.updateScreenName(user);
            if(ret > 0){
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
                user=userService.selectUserById(user.getUid());
                session.setAttribute(contants.USER_SESSION,user);
            }else{
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            }
        }catch (Exception e){
            e.printStackTrace();
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
        }
        return  returnObject;
    }
    //转跳到修改密码页面
    @RequestMapping("/account/settings/passwordEdit")
    public String psEdit(){
        //转跳到添加用户页面
        return "/account/passwordEdit";
    }
    //密码修改提交
    @RequestMapping("/account/settings/passwordEdit.do")
    public @ResponseBody Object updatePassword(User user){
        ReturnObject returnObject=new ReturnObject();
        String password=user.getPassword();
        user.setPassword(AppMD5.getMD5(password));
        try{
            int ret=userService.updatePassword(user);
            if(ret > 0){
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
            }else{
                returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            }
        }catch (Exception e){
            e.printStackTrace();
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
        }
        return  returnObject;
    }
    //转跳到修改密码页面
    @RequestMapping("/account/settings/imageEdit")
    public String imEdit(){
        //转跳到添加用户页面
        return "/account/imageEdit";
    }

    @RequestMapping("/account/settings/image.do")
    public @ResponseBody Object imEditDo(String uid, String base64) throws IOException {
        //
        final String[] base64Array = base64.split(",");
        String dataUir, data;
        if (base64Array.length > 1) {
            dataUir = base64Array[0];
            data = base64Array[1];
        } else {
            //根据你base64代表的具体文件构建
            dataUir = "data:image/jpg;base64";
            data = base64Array[0];
        }
        MultipartFile image = new Base64ToMultipartFile(data, dataUir);
        ReturnObject returnObject=new ReturnObject();
        try {
            String filePath = System.getProperty("evan.webapp") + ("assets/images/users/") + uid +(".jpg");
            File file=new File(filePath);
            System.out.println(image.getName());
            image.transferTo(file);
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_SUCCESS);
        }catch (Exception e){
            returnObject.setCode(contants.RETRUN_OBJECT_CODE_FAIL);
            returnObject.setMessage("文件上传失败");
        }
        return  returnObject;
    }
}
