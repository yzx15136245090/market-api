<?php
header('Content-Type:application/json;charset=UTF-8');
$pname = $_REQUEST['pname'];
$pone = $_REQUEST['pone'];
$ptwo = $_REQUEST['ptwo'];
$price = $_REQUEST['price'];
$newold = $_REQUEST['newold'];
$pubtime = $_REQUEST['pubtime'];
$retaintime = $_REQUEST['retaintime'];
$pdesc = $_REQUEST['pdesc'];
$pres = $_REQUEST['pres'];
$conn = mysqli_connect('localhost', 'root', '', 'OldDeal');
$sql = 'set names utf8';
mysqli_query($conn,$sql);
$sql = "insert into pub values(null,'$pname','$pone','$ptwo','$price','$newold','$pubtime','$retaintime','$pdesc','$pres','','','','','','')";
$result = mysqli_query($conn,$sql);
if($result){ //SQL语句执行成功
	echo 'ok';
}else {  //SQL语句执行失败
echo 'err';
}
//pname=11&pone=22&ptwo=33&price=55&newold=66&pubtime=2013&retaintime=88&pdesc=99&pres=1010