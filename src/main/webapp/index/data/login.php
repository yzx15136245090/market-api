<?php
/**接收客户端提交的用户名和密码，验证是否正确，向客户端输出ok或err**/
header('Content-Type: text/plain');
$uname = $_REQUEST['uname'];
$upwd = $_REQUEST['upwd'];
$conn = mysqli_connect('localhost','root','','olddeal');
$sql = "SET NAMES UTF8";
mysqli_query($conn, $sql);
$sql= "SELECT uid FROM oldDeal_user WHERE uname='$uname'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
$uid=intval($row['uid']);
$sql2= "SELECT upwd FROM oldDeal_user WHERE uid='$uid'";
$result2 = mysqli_query($conn, $sql2);
$row2 = mysqli_fetch_assoc($result2);
$upwd1= $row2['upwd'];
if($result===false){
echo 'sqlerr';
}else if(!$row){
  echo '用户名不存在';
}else if($row&&$upwd!=$upwd1){
  echo '密码不正确，请重新输入密码';
}else if($row&&$upwd===$upwd1){
	echo 'ok';
}
