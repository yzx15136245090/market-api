package cn.edu.apitest;

import com.zzti.market.entity.User;
import com.zzti.market.service.UserService;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * @Author: yzx
 * @Description:
 * @Date: Create in 16:02 2018/3/17
 */
public class UserApiTest extends BaseTest {

    @Resource
    private UserService userServiceImpl;

    @Test
    public void registTest(){
        User user =new User();
        user.setUserId("123");
        user.setPassWord("456");
        String register = userServiceImpl.register(user);
    }


}
