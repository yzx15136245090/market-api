package com.zzti.market.controller;


import com.zzti.market.entity.User;
import com.zzti.market.service.UserService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RequestMapping("/market")
@Controller
public class UserConller {
    private Logger logger = LoggerFactory.getLogger(UserConller.class);
    @Resource
    private UserService userServiceImpl;

    /**
     * @Author: yzx
     * @Description: 注册
     * @Date: 10:34 2018/3/17
     */
    @RequestMapping("/userRegister")
    @ResponseBody
    public String register(@RequestBody String  requestData) {
        logger.info(requestData);
        JSONObject json=JSONObject.fromObject(requestData);
        String userId=json.getString("userId");
        String passWord = json.getString("passWord");
        User user =new User();
        user.setUserId(userId);
        user.setPassWord(passWord);
        return userServiceImpl.register(user);
    }
    /**
     * @Author: yzx
     * @Description:登录
     * @Date: 10:35 2018/3/17
     */
    @RequestMapping("/userLogin")
    @ResponseBody
    public String login(@RequestBody String requestData){
        JSONObject json=JSONObject.fromObject(requestData);
        String userId=json.getString("userId");
        String passWord = json.getString("passWord");
        User user =new User();
        user.setUserId(userId);
        user.setPassWord(passWord);
        return  userServiceImpl.login(user);
    }
    /**
     * @Author: yzx
     * @Description:
     * @Date: 10:52 2018/3/17
     */
   /* @RequestMapping("/putUserInfo")
    @ResponseBody
    public  String putUserInfo(@RequestBody String requestData){
        JSONObject json=null;
        JSONObject rejson = new JSONObject();
        String userNumber =new String();
        String passWord = new String();
        User user =new User();

        return  userServiceImpl.putUserInfo(user).toString();
    }*/
}
