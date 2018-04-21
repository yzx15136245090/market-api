package com.zzti.market.controller;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.zzti.market.entity.*;
import com.zzti.market.enums.CommonStatus;
import com.zzti.market.result.*;
import com.zzti.market.enums.ResultType;
import com.zzti.market.service.GoodsService;
import org.apache.commons.lang.StringUtils;
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
    private Goods goods;
    private Goodspicture goodspicture;
    private PageResult pageResult;

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
	public List<Fathertype> fathertype(){
		List<Fathertype> fathertypeList=goodsService.fathertype();
		return fathertypeList;
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
	@RequestMapping("/childType")
	public List<Childtype> childtype(String typeid) {
		return goodsService.childtype(typeid);
	}


   /**
	* @method releaseGoods
	* @Author: zhixiang.yang
	* @Description: 发布商品
	* @Date: 19:40 2018/4/12
    * @param userId
    * @param goodsname 商品名称
    * @param goodstype 商品一级类别  传id
    * @param goodschildtype 商品二级类别  传id
    * @param description  商品描述
    * @param price  商品价格
    * @param bargain  是否议价
    * @param old  几成新
    * @param indate  发布期限
    * @param place   交易地点
    * @param request
    * @param file1
    * @param file2
    * @param file3
    * @param file4
	* @return: com.zzti.market.entity.Result
	* @respbody:
	*/
    @RequestMapping("/release")
    public Result releaseGoods(@RequestParam(required = true)String userId,
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
		MultipartFile[] cms=new MultipartFile[4];
		if(file1!=null){
			cms[0]=file1;
		}else if(file2!=null){
			cms[1]=file2;
		}else if(file3!=null){
			cms[2]=file3;
		}else if(file4!=null){
			cms[3]=file4;
		}
		List<String> goodspicList=new ArrayList<>();
		List<String> picnameList=new ArrayList<>();
		for(int i=0;i<cms.length;i++){
			if(cms[i]!=null){
				//保存图片并且保存到数据库
				String goodspic=UUID.randomUUID().toString().replace("-", "");
				goodspicList.add(goodspic);
				String pname=(cms[i].getOriginalFilename()).substring((cms[i].getOriginalFilename()).lastIndexOf("."));
				String picname=goodspic+pname;
				picnameList.add(picname);
				String ddd=File.separator;
				String sd=System.getProperty("user.dir");
				String p1 = request.getSession().getServletContext().getRealPath("");
				String path=p1.substring(0,p1.lastIndexOf(ddd));
				String path2=path.substring(0,p1.lastIndexOf(ddd));
			//	String path=sd+ddd+"picture";
				String file=path2+ddd+"picture"+ddd+picname;
				try {
					cms[i].transferTo(new File(file));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
        goodsService.releaseGoods(userId,goodsname,goodstype,goodschildtype,description,price,bargain,old,indate,place,goodspicList,picnameList);
          return  result;
    }


    /**
	 * @method getGoodsPage
	 * @Author: zhixiang.yang
	 * @Description:  分页查询商品
	 * @Date: 16:39 2018/4/21
	 * @param startPage   第几页|Integer|必输
	 * @param pageSize	   每页多少条|Integer|必输
	 * @param name			商品名称|String| 通过模糊搜索时，输入  （上架中的）
	 * @param type			商品类型，一级分类的编号|String| 类别搜索时输入（上架中的）
	 * @param userId		用户id|String|获取我的发布商品时输入（分为上架中  和  已下架 两个）
	 * @param status		商品状态|String| 0 上架中  1  已下架  必输
	 * @return: com.zzti.market.result.PageResult
	 * @respbody:
	 */
    @RequestMapping("/getGoodsPage")
    public PageResult getGoodsPage(Integer startPage,Integer pageSize,
                                   @RequestParam(required = false) String name,
                                   @RequestParam(required = false) String type,
                                   @RequestParam(required = false) String userId,
                                   @RequestParam(required = true) String status){
        pageResult=new PageResult();
        if(startPage==null||pageSize==null){
            pageResult.setCode(ResultType.RESULT_ERROR.getStatus());
            pageResult.setMessage("参数错误");
            return  pageResult;
        }
        List<GoodsResult> list=goodsService.getGoodsListPage(startPage, pageSize, name, type, userId, status);
        int count = goodsService.getCountGoods(name, type, userId, status);
        pageResult.setData(list);
        pageResult.setCount(count);
        return  pageResult;
    }

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
