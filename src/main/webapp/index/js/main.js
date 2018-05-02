function tochat(gid){$.post("/old/manager/islogin",{},function(data){

	if(data==1){
		alert("请先登录！");
		document.getElementById("toLogin").click();
	return "no";
		
	}
		else{
			window.location.href="/old/tochat?goodsid="+gid;
		}

	})
	
}
function addShopCat(gid){
	
$.post("/old/addshopcat",{goodsid:gid},
		   function(data){
		
		   });
}
function buy(gid){
	$.post("/old/addbuy",{goodsid:gid},
			   function(data){
			   
			   });
	}

function goodsdetail(id){
	window.location.href="/old/goodsDetail?goodsid="+id;
	
}

function searchGoods(){
	var sa=$("#txtSearch").val();
	var loading="";
	var startPageTemp=$("#startPageTemp").val();
	if(sa!="")
	{	$("#box").empty().append(loading);
	//copy 复制一份 post ajax 形式
	   $.post("/old/searchGoods",{startPage:0,pageSize:20,goodsname:sa},
			   function(data){
			
		     $("#box").empty().append(data);
		    
			var options = { 
					bootstrapMajorVersion:3, //版本
                  currentPage:startPageTemp, //当前页数
                  totalPages:$("#totalPages").val(), //总页数
                  size:"normal",//设置控件的显示大小，是个字符串. 允许的值: mini, small, normal,large。值：mini版的、小号的、正常的、大号的。
                  numberOfPages:5, //总页数,//设置分页每次显示的页数
                  shouldShowPage:true, // 该参数用于设置某个操作按钮是否显示
                  itemTexts: function (type, page, current) {
                      switch (type) {
                          case "first":
                              return "首页";
                          case "prev":
                              return "上一页";
                          case "next":
                              return "下一页";
                          case "last":
                              return "末页";
                          case "page":
                              return page;
                      }
                  },//点击事件，用于通过Ajax来刷新整个list列表
                  onPageClicked: function (event, originalEvent, type, page){
                   $("#box").empty().append(loading);
                     startPageTemp=page;
                     $.post("/old/searchGoods",{startPage:page-1,pageSize:20},
                    function(data){
                     	 $("#box").empty().append(data);
                      
                   });
                  }
              };
			
			  $('#pageLimit').bootstrapPaginator(options);
			
		 });
	}
	else{
		return ;
	}
	
}
	

$(function(){
	$.post("/old/manager/islogin",{},function(data){
		if(data==1){
			
		return "no";
		}
			else{
				$("#toLogin").hide();
				$("#noUser").show();
				$("#buy").show();                        
				return false;
			}

		})
	$('.pull-menu li a').click(function(){
        $('.pull-menu li').removeClass('subnav-click');
        $(this).parent().addClass('subnav-click');
  
   })	
	$("#toLogin").attr("href","./login.jsp");
	$("#toRegister").attr("href","./register.jsp");
	$("#goHomePage").attr("href","./firstPage.jsp");
	
	
});


function  islogin(){
	
	$.post("/checkLogin",{},function(data){

	    debugger;
		if(data==1){
			alert("请先登录！");
			document.getElementById("toLogin").click();
		return "no";

		}
			else{
				return false;
			}

		})
}
function typesearch(q){
	
	   
	var loading="";
	var startPageTemp=$("#startPageTemp").val();
	$("#box").empty().append(loading);
	//copy 复制一份 post ajax 形式
	   $.post("/old/selectGoodsByType",{startPage:0,pageSize:20,goodstype:q},
			   function(data){
			
		     $("#box").empty().append(data);
		    
			var options = { 
					bootstrapMajorVersion:3, //版本
                  currentPage:startPageTemp, //当前页数
                  totalPages:$("#totalPages").val(), //总页数
                  size:"normal",//设置控件的显示大小，是个字符串. 允许的值: mini, small, normal,large。值：mini版的、小号的、正常的、大号的。
                  numberOfPages:5, //总页数,//设置分页每次显示的页数
                  shouldShowPage:true, // 该参数用于设置某个操作按钮是否显示
                  itemTexts: function (type, page, current) {
                      switch (type) {
                          case "first":
                              return "首页";
                          case "prev":
                              return "上一页";
                          case "next":
                              return "下一页";
                          case "last":
                              return "末页";
                          case "page":
                              return page;
                      }
                  },//点击事件，用于通过Ajax来刷新整个list列表
                  onPageClicked: function (event, originalEvent, type, page){
                   $("#box").empty().append(loading);
                     startPageTemp=page;
                     $.post("/old/selectGoodsByType",{startPage:page-1,pageSize:20},
                    function(data){
                     	 $("#box").empty().append(data);
                      
                   });
                  }
              };
			
			  $('#pageLimit').bootstrapPaginator(options);
			
		 });
	
}
    //悬浮显示菜单
    $('.pructNav').hover(function(){
        $(this).children('.pull-menu').fadeIn(300);
    },function(){
        $(this).children('.pull-menu').fadeOut(300);
    });
//轮播功能
var imgs=[
    {"i":0,"img":"images/banner.jpg"},
    {"i":1,"img":"images/banner.jpg"},
    {"i":2,"img":"images/banner.jpg"},
];
var slider={
    LIWIDTH:0,//保存每个li的宽度,其实就是#slider的宽
    DURATION:1000,//动画的总时间
    WAIT:3000,//自动轮播之间的等待时间
    timer:null,//保存一次性定时器序号
    canAuto:true,//保存是否可以自动轮播
    init:function(){
        this.LIWIDTH=parseFloat(
            $("#slider").css("width")
        );
        this.updateView();
        //为id为indexs的ul添加鼠标进入事件代理，只有不是hover的li才能响应事件
        $("#indexs").on("mouseover","li:not(.hover)",
            function(e){
                //获得目标元素$target
                var $target=$(e.target);
                //调用move方法，传入要移动的个数:
                //目标元素的内容-目标元素的兄弟中class为hover的li的内容
                this.move($target.html()
                    -$target.siblings(".hover").html());
            }.bind(this));
        //当鼠标进入#slider时，将canAuto改为false
        //当鼠标移出#slider时，将canAuto改为true
        $("#slider").hover(
            function(){this.canAuto=false;}.bind(this),
            function(){this.canAuto=true;}.bind(this)
        )
        this.autoMove();
    },
    autoMove:function(){//启动自动轮播
        //启动一次性定时器:
        this.timer=setTimeout(
            function(){
                if(this.canAuto){
                    this.move(1);//调用move执行移动一个
                }else{
                    this.autoMove();//继续等待
                }
            }.bind(this),
            this.WAIT
        );
    },
    move:function(n){
        clearTimeout(this.timer);//停止一次性定时器
        this.timer=null;
        $("#imgs").stop(true);//停止动画，防止叠加
        if(n<0){//如果n<0,右移，先改数组，再移动
            n*=-1;//将n转为正数
            imgs=//先删除结尾的n个元素，拼接到开头
                imgs.splice(imgs.length-n,n).concat(imgs);
            this.updateView();//更新界面
            //获得#imgs当前的left,转为浮点数
            var left=parseFloat($("#imgs").css("left"));
            //修改#imgs的left为left-n*LIWIDTH
            $("#imgs").css("left",left-n*this.LIWIDTH);
            //启动动画，在DURATION时间内，left移动到0
            $("#imgs").animate(
                {left:"0"},
                this.DURATION,
                this.autoMove.bind(this)
            );
        }else{//否则, 左移,先移动，再改数组
            //让#imgs的ul再DURATION事件内，left变为-n*LIWIDTH
            $("#imgs").animate(
                {left:-n*this.LIWIDTH+"px"},
                this.DURATION,
                //在动画结束后调用endMove,替换this，传入参数n
                this.endMove.bind(this,n)
            );
        }
    },
    endMove:function(n){
        //删除imgs开头的n个元素,再拼到结尾
        imgs=imgs.concat(imgs.splice(0,n))
        this.updateView();//更新页面
        $("#imgs").css("left",0);//设置#imgs的left为0
        this.autoMove();//启动自动轮播
    },
    updateView:function(){//将数组中的元素更新到页面
        //遍历imgs数组中每个对象,同时声明空字符串html
        for(var i=0,html="",idxs="";i<imgs.length;i++){
            html+="<li><img src='"+imgs[i].img+"'></li>";
            idxs+="<li>"+(i+1)+"</li>";
        }
        //设置id为imgs的内容为html,再设置其宽为LIWIDTH*imgs的元素个数
        $("#imgs").html(html)
            .css("width",this.LIWIDTH*imgs.length);
        //设置id为indexs的内容为idxs
        $("#indexs").html(idxs);
        //获得#indexs下的和imgs中第一个元素的i属性对应的li,设置其class为hover,选择兄弟中的class为hover的li,清除其class
        $("#indexs>li:eq("+imgs[0].i+")")
            .addClass("hover")
            .siblings(".hover").removeClass("hover");
    }
}
slider.init();
//注册
$('#register-btn').click(function(){
    //读取用户的输入——表单序列化
    var inputData = $('#register-form').serialize();
    //异步提交请求，进行验证
    $.ajax({
        type: 'POST',
        url: 'data/register.php',
        data: inputData,
        success: function(txt, msg, xhr){
            if(txt=='ok'){
                alert('注册成功')
            }else { //登录失败
                //$('.modal .alert').html('登录失败！错误消息为：'+txt);
                alert('注册失败')
            }
        }
    });
});
//登录
$(".login-form input[name='uname']").focus(function(){
    $('.login-form div .uname').css('display','block');
});
$(".login-form input[name='uname").blur(function(){
    var uname=$('input[name="uname"]').val();
    if(uname!=''){
        $('.login-form div .uname').css('display','none');
    }
});
$(".login-form input[name='upwd']").focus(function(){
    $('.login-form div .upwd').css('display','block');
});
$(".login-form input[name='upwd']").blur(function(){
    var upwd=$('input[name="upwd"]').val();
    if(upwd!=''){
        $('.login-form div .upwd').css('display','none');
    }
});


//发布商品
$('#pub').click(function(){
    var pubData = $('form').serialize();
    $.ajax({
        type:'POST',
        url:'data/pub.php',
        data:pubData,
        success:function(pubData){
            console.log(pubData);
        }
    })
});
//发布商品预览功能
function previewImage(file,imgNum)
{
    var div = document.getElementById('preview'+imgNum);
    if (file.files && file.files[0])
    {
        div.innerHTML ='<img id=imghead'+imgNum+'>';
        var img = document.getElementById('imghead'+imgNum+'');
        img.onload = function(){
            img.width  =50;
            img.height =50;
        }
        var reader = new FileReader();
        reader.onload = function(evt){img.src = evt.target.result;}
        reader.readAsDataURL(file.files[0]);
    }
    else
    {
        var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        var src = document.selection.createRange().text;
        div.innerHTML = '<img id=imghead'+imgNum+'>';
        var img = document.getElementById('imghead2');
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
    }
//    if(imgNum<=6){
//    	
//    	var li = $("<li></li>");
//    	
//    	var div = $("<div id=\"preview"+(imgNum+1)+"\"></div>");
//    	var input = $("<input  id=\"st"+(imgNum+1)+"\" name=\"files\" onchange=\"previewImage(this,"+(imgNum+1)+")\" type=\"file\"/>");
//    	li.append(div).append(input);
//    	$(".clearfix").append(li);
//    	
//    }
    
}