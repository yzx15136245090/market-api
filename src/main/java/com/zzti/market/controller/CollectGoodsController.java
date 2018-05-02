package com.zzti.market.controller;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.zzti.market.enums.ResultType;
import com.zzti.market.result.PageResult;
import com.zzti.market.result.Result;
import com.zzti.market.service.CollectgoodsService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @Title:
 * @Package: com.zzti.market.controller
 * @ClassName: CollectGoodsController
 * @Description:
 * @Author: zhixiang.yang
 * @CreateDate: 2018/4/23 9:53
 * @UpdateUser: zhixiang.yang
 * @UpdateDate: 2018/4/23 9:53
 * @UpdateRemark:
 * @Version: 1.0
 */
@RestController
public class CollectGoodsController {

    @Resource
    private CollectgoodsService collectgoodsService;


    private Result result;

    private PageResult pageResult;

    /**
     * @method addCollectGoods
     * @Author: zhixiang.yang
     * @Description: 添加收藏（购物车）
     * @Date: 10:11 2018/4/23
     * @param goodsid  商品id|String|必输
     * @param userid      用户id |String|必输
     * @param type       类型，0 为收藏  1 为购物车 |String|必输
     * @return: com.zzti.market.result.Result
     * @respbody:
     */
    @RequestMapping("/addCollectGoods")
    public Result addCollectGoods(@RequestParam(required = true)String goodsid,@RequestParam(required = true)String userid,@RequestParam(required = true)String type){
        result=new Result();
        if(StringUtils.isEmpty(goodsid)||StringUtils.isEmpty(userid)||StringUtils.isEmpty(type)){
            result.setCode(ResultType.RESULT_ERROR.getStatus());
            result.setMessage("参数错误");
            return  result;
        }
        collectgoodsService.addCollectGoods(goodsid,userid,type);
        return  result;
    }

    /**
     * @method getUserCollect
     * @Author: zhixiang.yang
     * @Description: 查看我的收藏（我的购物车）
     * @Date: 16:41 2018/4/25
     * @param usrid      用户id|String |必输
     * @param startPage
     * @param pageSize
     * @param type*   类型，0 为收藏  1 为购物车 |String|必输
     * @return: com.zzti.market.result.PageResult
     * @respbody:
     */
    @RequestMapping("/getUserCollect")
    public PageResult getUserCollect(@RequestParam(required = true) String usrid,
                                     @RequestParam(required = true) Integer startPage,
                                     @RequestParam(required = true)Integer pageSize,
                                     @RequestParam(required = true)String type){
        pageResult=new PageResult();
        if(StringUtils.isEmpty(usrid)||startPage==null||pageSize==null){
            pageResult.setCode(ResultType.RESULT_ERROR.getStatus());
            pageResult.setMessage("参数错误");
            return  pageResult;
        }
        pageResult.setData(collectgoodsService.getCollecgoodsPage(startPage,pageSize,usrid,type));
        pageResult.setCount(collectgoodsService.getCountCollectGoods(usrid,type));
        return  pageResult;
    }


    /**
     * @method removeCollect
     * @Author: zhixiang.yang
     * @Description: 取消收藏（从购物车删除）
     * @Date: 10:13 2018/4/25
     * @param userid  用户id
     * @param goodsid  商品id
     * @param type       类型，0 为收藏  1 为购物车 |String|必输
     * @return: com.zzti.market.result.Result
     * @respbody:
     */
    @RequestMapping("/removeCollect")
    public Result removeCollect(@RequestParam(required = true)String userid,
                                @RequestParam(required = true)String goodsid,
                                @RequestParam(required = true)String type){
        result=new Result();
        if(StringUtils.isEmpty(goodsid)||StringUtils.isEmpty(userid)){
            result.setCode(ResultType.RESULT_ERROR.getStatus());
            result.setMessage("参数错误");
            return  result;
        }
        collectgoodsService.removeCollectGoods(goodsid,userid,type);
        return  result;
    }


}
