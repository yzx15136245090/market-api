package com.zzti.market.controller;

import javax.annotation.Resource;

import com.zzti.market.enums.ResultType;
import com.zzti.market.result.PageResult;
import com.zzti.market.result.Result;
import com.zzti.market.service.BuymessageService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class BuymessageController {
	@Resource
	BuymessageService buymessageService;

	private  Result result;

	private PageResult pageResult;

	/**
     * @method ReleaseBuymessage
     * @Author: zhixiang.yang
     * @Description: 发布求购
     * @Date: 17:02 2018/4/16
     * @param userId  用户id
     * @param buygoodsname 求购名称
     * @param buygoodsdescrip  求购物品描述
     * @param wantprice       期望价格
     * @param wantsite        交易地点
     * @param buyindate       求购期限
     * @return: com.zzti.market.entity.Result
     * @respbody:
     */
	@RequestMapping("/releaseBuymessage")
	public Result ReleaseBuymessage(String userId,
                                    String buygoodsname,
                                    String buygoodsdescrip,
                                    Integer wantprice,
                                    String wantsite,
                                    Integer buyindate) {
		 result=new Result();

		 buymessageService.ReleaseBuymessage(userId, buygoodsname, buygoodsdescrip, wantprice, wantsite, buyindate);
		 return result;
	}

	/**
	 * @method getBuyMessagePage
	 * @Author: zhixiang.yang
	 * @Description: 分页查询求购信息
	 * @Date: 16:36 2018/4/25
	 * @param userId         用户id  |String |非必输，查询我的求购时需要输入
	 * @param startPage
	 * @param pageSize
	 * @param buystatus			求购信息状态  | 0 为有效  app 传 0
	 * @return: com.zzti.market.result.PageResult
	 * @respbody:
	 */
	@RequestMapping("/getBuyMessagePage")
	public PageResult getBuyMessagePage(@RequestParam(required = false) String userId,
										@RequestParam(required = true) Integer startPage,
										@RequestParam(required = true) Integer pageSize,
										@RequestParam(required = true) Integer buystatus){
		pageResult=new PageResult();
		if(startPage==null||pageSize==null||buystatus==null)
		{
			pageResult.setCode(ResultType.RESULT_ERROR.getStatus());
			pageResult.setMessage("参数不正确");
			return  pageResult;
		}
		pageResult.setData(buymessageService.getBuymessage(userId, startPage, pageSize, buystatus));
		pageResult.setCount(buymessageService.getCountBuymessage(userId,buystatus));
		return pageResult;
	}
}
