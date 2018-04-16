package com.zzti.market.controller;

import javax.annotation.Resource;
import com.zzti.market.entity.Result;
import com.zzti.market.service.BuymessageService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class BuymessageController {
	@Resource
	BuymessageService buymessageService;

	private  Result result;

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
	//查询发布状态下的求购信息
	//@ResponseBody
	//@RequestMapping("/allBuymessage0")
	//public List<Buymessage> allBuymessage0() {
	// buymessageService.allBuymessage(0);
	//}
	//查询过期状态下的求购信息
//
//	@RequestMapping("/allBuymessage1")
//	public List<Buymessage> allBuymessage1() {
//		return buymessageService.allBuymessage(1);
//	}
//	@RequestMapping("/allBuymessage0")
//	public String allBuymessage0(HttpSession session,Model model,int startPage,int  pageSize) {
//		List<Buymessage> buymessageList=buymessageService.allBuymessage(0, startPage, pageSize);
//		int totalPages = buymessageService.findBuymessageNumber(0); //
//		model.addAttribute("buymessageList", buymessageList);
//		model.addAttribute("totalPages", (totalPages/pageSize)+(totalPages%pageSize==0?0:1));
//
//		return "buymessageData";
//	}
}
