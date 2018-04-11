package com.zzti.market.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.zzti.market.entity.*;
import com.zzti.market.enums.ResultType;
import com.zzti.market.service.GoodsService;
import org.apache.commons.lang.StringUtils;
import org.aspectj.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@RestController
public class GoodsController {
  
	@Resource
	GoodsService goodsService;
    private Result result;

    /**
	 * @method fathertype
	 * @Author: zhixiang.yang
	 * @Description: 获取一级分类
	 * @Date: 16:53 2018/4/11
	 * @param
	 * @return: java.util.List<com.zzti.market.entity.Fathertype>
	 * @respbody:
	 */
	@RequestMapping("/fatherType")
	@ResponseBody
	public List<Fathertype> fathertype(){
		List<Fathertype> fathertypeList=goodsService.fathertype();
		return fathertypeList;
	}
    @ResponseBody
	@RequestMapping("/te")
	public String father(){
		return "s";
	}
	/**
	 * @method childtype
	 * @Author: zhixiang.yang
	 * @Description: 获取二级分类
	 * @Date: 16:53 2018/4/11
	 * @param typeid  一级分类id
	 * @return: java.util.List<com.zzti.market.entity.Childtype>
	 * @respbody:
	 */
	@ResponseBody
	@RequestMapping("/childType")
	public List<Childtype> childtype(String typeid) {
		return goodsService.childtype(typeid);
	}
	//发布商品
    /**
	 * @method appReleaseGoods
	 * @Author: zhixiang.yang
	 * @Description:
	 * @Date: 14:55 2018/4/10
	 * @param userId
	 * @param goodsname
	 * @param description
	 * @param price
	 * @param bargain
	 * @param old
	 * @param inDate
	 * @param place
	 * @param img1
	 * @param img2
	 * @param img3
	 * @param img4
	 * @return: com.zzti.market.entity.Result
	 * @respbody:
	 */
    @RequestMapping("/release")
    public Result releaseGoods(@RequestParam(required = true)String token,
    		@RequestParam(required = true)String userId,
								  @RequestParam(required = true)String goodsname,
								  @RequestParam(required = true)String goodstype,
								  @RequestParam(required = true)String goodschildtype,
								  @RequestParam(required = true)String description,
								  @RequestParam(required = true)String price,
								  @RequestParam(required = true)Integer bargain,
								  @RequestParam(required = true)Integer old,
								  @RequestParam(required = true)Integer  indate,
								  @RequestParam(required = true)String place,
								  HttpServletRequest request,
								  @RequestParam(required = true) MultipartFile file1,
								  @RequestParam(required = false) MultipartFile file2,
							   	  @RequestParam(required = false) MultipartFile file3,
								  @RequestParam(required = false) MultipartFile file4)
	{
		result=new Result();
		if(StringUtils.isBlank(userId)||StringUtils.isBlank(goodsname)||StringUtils.isBlank(description)||StringUtils.isBlank(place)||file1==null||StringUtils.isBlank(price)||bargain==null||old==null||indate==null){
			result.setCode(ResultType.RESULT_ERROR.getStatus());
			return  result;
		}
		MultipartFile[] cms={file1,file2,file3,file4};
		goodsService.releaseGoods(userId,goodsname,goodstype,goodschildtype,description,price,bargain,old,indate,place,cms,request);
          return  result;
    }

//	@RequestMapping("/release")
//	public String ReleaseGoods(@RequestParam("file1") MultipartFile cm1, @RequestParam("file2") MultipartFile cm2,
//							   @RequestParam("file3") MultipartFile cm3,
//							   @RequestParam("file4") MultipartFile cm4,
//
//							   Goods goods, HttpServletRequest request, HttpSession session) {
//		 MultipartFile[] cms={cm1,cm2,cm3,cm4};
//		 System.out.println(goods.getGoodsname());
//        goodsServiceImpl.ReleaseGoods(cms,goods, request);
//
//			return "redirect:/index/firstPage.jsp";
//	}
	//查询发布状�?�的商品信息

//	@RequestMapping("/allGoods0")
//	public String allGoods0(HttpSession session,Model model,int startPage,int  pageSize,HttpServletRequest request) {
//		List<GoodsMore> goodsList= goodsServiceImpl.allGoods("0",startPage,pageSize,request);
//		int totalPages = goodsServiceImpl.findGoodsNumber("0"); //
//		model.addAttribute("goodsList", goodsList);
//		model.addAttribute("totalPages", (totalPages/pageSize)+(totalPages%pageSize==0?0:1));
//		return "goodsData";
//	}
//	@RequestMapping("/goodsDetail")
//	public String goodsDetail(Model model,String goodsid,HttpServletRequest request) {
//	Goods goods=goodsServiceImpl.goodsDetail(goodsid,request);
//		model.addAttribute("goods", goods);
//		return "detail";
//
//	}
//
//	@RequestMapping("/userGoods0")
//	public String userGoods0(HttpSession session,Model model,int startPage,int  pageSize,HttpServletRequest request) {
//		User user=(User) session.getAttribute("user");
//		String userid=user.getUserId();
//		List<Goods> usergoodsList= goodsServiceImpl.userGoods("0",userid, startPage,pageSize,request);
//
//		int totalPages = goodsServiceImpl.findGoodsNumberByUserId("0",userid);
//		model.addAttribute("usergoodsList", usergoodsList);
//		model.addAttribute("totalPages", (totalPages/pageSize)+(totalPages%pageSize==0?0:1));
//
//		return "userGoods";
//	}
//	@RequestMapping("/selectGoodsByType")
//	public String selectGoodsByType(HttpSession session,Model model,int startPage,int  pageSize,HttpServletRequest request,String goodstype) {
//		System.out.println(goodstype);
//		List<Goods> typegoodsList= goodsServiceImpl.typeGoods("0", goodstype, startPage, pageSize, request);
//
//		int totalPages = goodsServiceImpl.findGoodsNumberByGoodsType("0",goodstype);
//		System.out.println(totalPages);
//		model.addAttribute("goodsList", typegoodsList);
//		model.addAttribute("totalPages", (totalPages/pageSize)+(totalPages%pageSize==0?0:1));
//
//		return "goodsData";
//	}
//	@RequestMapping("/searchGoods")
//	public String searchGoods(HttpSession session,Model model,int startPage,int  pageSize,HttpServletRequest request,String goodsname) {
//		System.out.println(goodsname);
//		List<Goods> searchgoodsList= goodsServiceImpl.searchGoods("0", goodsname, startPage, pageSize, request);
//
//		int totalPages = goodsServiceImpl.findGoodsNumberByGoodsType("0",goodsname);
//		System.out.println(totalPages);
//		model.addAttribute("goodsList", searchgoodsList);
//		model.addAttribute("totalPages", (totalPages/pageSize)+(totalPages%pageSize==0?0:1));
//
//		return "goodsData";
//	}
}
