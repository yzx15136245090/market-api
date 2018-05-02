package com.zzti.market.adapter;

import com.zzti.market.interceptor.MyHandShakeInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;


/**
 * @Title:
 * @Package: com.zzti.market.adapter
 * @ClassName: MyWebSocketConfig
 * @Description:
 * @Author: zhixiang.yang
 * @CreateDate: 2018/4/23 16:47
 * @UpdateUser: zhixiang.yang
 * @UpdateDate: 2018/4/23 16:47
 * @UpdateRemark:
 * @Version: 1.0
 */
@Component
@EnableWebSocket
public class MyWebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer{

    @Autowired
    MyWebSocketHandler handler;
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry webSocketHandlerRegistry) {
        //添加websocket处理器，添加握手拦截器
        webSocketHandlerRegistry.addHandler(handler, "/ws").addInterceptors(new MyHandShakeInterceptor());

        //添加websocket处理器，添加握手拦截器
        webSocketHandlerRegistry.addHandler(handler, "/ws/sockjs").addInterceptors(new MyHandShakeInterceptor()).withSockJS();
    }
}
