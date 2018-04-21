package com.zzti.market.controller;


import com.zzti.market.result.PageResult;
import com.zzti.market.result.Result;
import com.zzti.market.entity.User;
import com.zzti.market.service.UserService;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
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

    private PageResult pageResult;

    /**
     * @Author: yzx
     * @Description: 注册
     * @Date: 10:34 2018/3/17
     */
    @RequestMapping("market/userRegister")
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
     * @method getUserInfo
     * @Author: zhixiang.yang
     * @Description: 获取用户信息
     * @Date: 18:18 2018/4/19
     * @param userId  用户账号
     * @return: com.zzti.market.entity.Result
     * @respbody:
     */
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

    public Result checklogin(){
        result=new Result();
        Map userMap= (Map) session.getAttribute("userMap");
        String mytoken=userMap.get("token").toString();
        String myuserId=userMap.get("userId").toString();
        result.setData(userService.getUserInfo(myuserId));
        return result;
    }


}
