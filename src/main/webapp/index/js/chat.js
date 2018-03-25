$("#submit").click(function(){
	alert("as");
	var te=$("#mainedit").val();
	var console = Console.Win + " #console",
	obj = '<div class="row"><span class="headpic src" title="' + "name" + '"></span><i class="src"></i><div class="src"><p></p><br><p class="time">' + new Date().toLocaleString() + '</p></div>';
		obj = $(obj);
		obj.find("p").e.html(te);
		obj.fadeIn('slow').appendTo(console);
		scrollToBottom($(console));
});
