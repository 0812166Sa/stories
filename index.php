<?php
session_start();
error_reporting(-1);
ini_set('display_errors', 1);
header('Content-Type: text/html; charset=utf-8');
include_once './config.php';
include_once './libs/default.php';
$link = mysqli_connect('localhost', 'solo', '100587', 'solotatyana');
mysqli_set_charset($link, 'UTF-8');
/*
 if($link) {
     echo 'соединено';
     
 }
else {
    echo 'no';
}
*/
include_once './variables.php';

include './' . Core::$CONT . '/allpages.php';
ob_start();
/*
if(!file_exists('./'.Core::$CONT.'/'.$_GET['module'].'/'.$_GET['page'].'.php') || !file_exists('./skins/'.Core::$SKIN.'/'.$_GET['module'].'/'.$_GET['page'].'.tpl')) {
	header("Location: /404");
	exit();
}
*/
/*
include './'.Core::$CONT.'/'.$_GET['module'].'/'.$_GET['page'].'.php';
include './skins/'.Core::$SKIN.'/'.$_GET['module'].'/'.$_GET['page'].'.tpl';
$content=ob_get_contents();
ob_end_clean();
include './skins/'.Core::$SKIN.'/index.tpl';

*/
include './modules/' . $_GET['module'] . '/' . $_GET['page'] . '.php';
include './skins/' . $_GET['module'] . '/' . $_GET['page'] . '.tpl';
$content = ob_get_contents();
ob_end_clean();
include './skins/index.tpl';
//include './libs/class_Mail.php';
