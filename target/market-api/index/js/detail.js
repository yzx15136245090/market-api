

var zoom={
    MSIZE:175,//保存mask的大小
    MAXLEFT:175,MAXTOP:175,//保存mask可用的最大坐标
    init:function(){
        //为id为icon_list的ul添加鼠标进入事件代理，仅li下的img可响应事件，处理函数为changeImgs
        $("#icon_list").on(
            "mouseover","li>img",this.changeImgs);
        //为id为superMask的div添加hover事件,切换mask的显示和隐藏,再绑定鼠标移动事件为moveMask
     
    moveMask:function(e){
        var x=e.offsetX;//获得鼠标相对于父元素的x
        var y=e.offsetY;//获得鼠标相对于父元素的y
        //计算mask的left: x-MSIZE/2
        var left=x-this.MSIZE/2;
        //计算mask的top: y-MSIZE/2
        var top=y-this.MSIZE/2;
        //如果left越界，要改回边界值
        left=left<0?0:
            left>this.MAXLEFT?this.MAXLEFT:
                left;
        //如果top越界，要改回边界值
        top=top<0?0:
            top>this.MAXTOP?this.MAXTOP:
                top;
        //设置id为mask的元素的left为left,top为top
        $("#mask").css({left:left,top:top});
        //设置id为largeDiv的背景图片位置:
        $("#largeDiv").css(
            "backgroundPosition",
            -left*16/7+"px "+-top*16/7+"px");
    },
    toggle:function(){//切换mask的显示和隐藏
        $("#mask").toggle();
        $("#largeDiv").toggle();
        //如果largeDiv的display为block
        if($("#largeDiv").css("display")=="block"){
            //获得mImg的src
            var src=$("#mImg").attr("src");
            var i=src.lastIndexOf(".");
            var newSrc=
                src.slice(0,i-2)+src.slice(i);
            console.log(newSrc);
            $("#largeDiv").css(
                "backgroundImage","url("+newSrc+")");
        }
    },
    changeImgs:function(e){//根据小图片更换中图片
        //获得目标元素的src属性，保存在变量src中
        var src=$(e.target).attr("src");
        //查找src中最后一个.的位置i
        var i=src.lastIndexOf(".");
        //设置id为mImg的元素的src为:
        //src从开头-i 拼上-m  拼上src从i到结尾
        $("#mImg").attr(
            "src",src.slice(0,i)+src.slice(i));
    }
}
zoom.init();
