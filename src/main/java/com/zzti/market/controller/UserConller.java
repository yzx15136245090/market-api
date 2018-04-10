package com.zzti.market.controller;


import com.zzti.market.entity.User;
import com.zzti.market.service.UserService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/market")
@Controller
public class UserConller {
    private Logger logger = LoggerFactory.getLogger(UserConller.class);
    @Resource
    private UserService userService;
    @Resource
    private  HttpSession session;

    /**r
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
        return userService.register(user);
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
        String returnMes=userService.login(user);
        JSONObject rejson=JSONObject.fromObject(returnMes);
        if("1".equals(rejson.get("statusCode"))) {
            Map seMap = new HashMap();
            String token = rejson.getString("token");
            seMap.put("token", token);
            seMap.put("userId", userId);
            session.setAttribute("userMap", seMap);


        }
        return  returnMes;
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
    @ResponseBody
    @RequestMapping("/test")
    public  String putUserInfo(){


        return  "SUSSESS";
    }
   /* public  boolean checklogin(HttpSession session){
        Map userMap=(Map)session.getAttribute("user");
        String token=userMap.get("token").toString();
        String userId=userMap.get("userId").toString();
        if(!"".equals(token)&&!"".equals(userId))
        {
            return  true;
        }else {
            return  false;
        }
    }*/
    public boolean appChecklogin( @RequestParam("token")String token, @RequestParam("userId")String userId){
        Map userMap= (Map) session.getAttribute("userMap");
        String mytoken=userMap.get("token").toString();
        String myuserId=userMap.get("userId").toString();
        if(mytoken.equals(token)&&myuserId.equals(userId))
        {
            return  true;
        }else {
            return  false;
        }
    }
  @RequestMapping("/file")
    public void File(HttpServletRequest  request){

  }



}
