<?php
/**接收客户端提交的用户名和密码，验证是否正确，向客户端输出ok或err**/
header('Content-Type: text/plain');
$uname = $_REQUEST['uname'];
$upwd = $_REQUEST['upwd'];
$corfirmupwd = $_REQUEST['corfirmupwd'];
$QQ = $_REQUEST['QQ'];
$safe = $_REQUEST['safe'];
$answer = $_REQUEST['answer'];
echo $QQ;
if( !$uname || !$upwd){ //若客户端未提交必需的数据
	echo "{}";
	return;	//退出当前PHP页面的执行
}
//连接数据库
$conn = mysqli_connect('localhost', 'root', '', 'OldDeal');
//提交SQL
$sql = "SET NAMES UTF8";
mysqli_query($conn, $sql);
$sql = "insert into OldDeal_user value(null,'$uname','$upwd','$corfirmupwd','$QQ','$safe','$answer')";
$result = mysqli_query($conn,$sql);
if($result){ //SQL语句执行失败
	echo 'ok';
}else {  //SQL语句执行成功
echo 'err';
}

//uname=ss&upwd=1233&corfirmupwd=1111&QQ=111&safe=vvv&answer=ll