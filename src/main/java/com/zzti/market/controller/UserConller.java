package com.zzti.market.controller;


import com.sun.org.apache.regexp.internal.RE;
import com.zzti.market.entity.Result;
import com.zzti.market.entity.User;
import com.zzti.market.service.UserService;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
public class UserConller {
    private Logger logger = LoggerFactory.getLogger(UserConller.class);
    @Resource
    private UserService userService;
    @Resource
    private  HttpSession session;

    private  Result result;

    /**
     * @Author: yzx
     * @Description: 注册
     * @Date: 10:34 2018/3/17
     */
    @RequestMapping("market/userRegister")
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
    @RequestMapping("market/userLogin")
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

    @RequestMapping("user/getUserInfo")
    public Result getUserInfo(@RequestParam(required = true)String userId){
        result=new Result();
        if(userId==null){
            result.setCode(200);
            result.setMessage("userId不能为空");
        }

        result.setData(userService.getUserInfo(userId));
        return result;
    }
    /**
     * @method updateUserInfo
     * @Author: zhixiang.yang
     * @Description:
     * @Date: 11:56 2018/4/11
     * @param userId  用户id
     * @param userName  用户姓名
     * @param userSchool      用户学校
     * @param telphone     手机号
     * @param email        邮箱
     * @return: java.lang.String
     * @respbody:
     */
    @ResponseBody
                @RequestMapping("user/updateUserInfo")
    public  Result updateUserInfo(@RequestParam(required = true)String userId,
                                  @RequestParam(required = true) String userName,
                                  @RequestParam(required = false) String userSchool,
                                  @RequestParam(required = true) String telphone,
                                  @RequestParam(required = true) String email){
        result=new Result();
        if(StringUtils.isBlank(userId)||StringUtils.isBlank(userName)||StringUtils.isBlank(telphone)||StringUtils.isBlank(email))
        {
            result.setCode(200);
            result.setMessage("参数不正确");
            return  result;
        }
        userService.updateUserInfo(userId, userName, userSchool, telphone, email);
        return  result;
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
