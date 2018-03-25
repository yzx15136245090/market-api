

$('.myApp ul li a').click(function(e){
    e.preventDefault();
    $('#userCenter').css("display","none");
    //修改li的.active的位置
    $(this).parent().addClass('curr').siblings('.curr').removeClass('curr');

    //修改右侧主体中的div的.active位置
    var id = $(this).attr('href');
    $(id).addClass('curr').siblings('.curr').removeClass('curr');
})

$('#myOrder ul li a').click(function(e){
    e.preventDefault();
    //修改li的.active的位置
    $(this).parent().addClass('curr').siblings('.curr').removeClass('curr');

    //修改右侧主体中的div的.active位置
    var id = $(this).attr('href');
    $(id).addClass('curr').siblings('.curr').removeClass('curr');
   
})
