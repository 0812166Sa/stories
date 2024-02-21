<?php
if(isset($_SESSION['user'])) {    //код для авторизир.пользователей
	$res = q("
		SELECT *				
		FROM `users`
		WHERE `id`=".(int)$_SESSION['user']['id']." 
		LIMIT 1
	");
	$_SESSION['user'] = mysqli_fetch_assoc($res);//свежие данные после проверки
	$status = 'OK';
	if($_SESSION['user']['active'] == 2) { //если мы забанили пользователя
		include './modules/cab/exit.php';
	}
}
if(isset($_COOKIE['hash'], $_COOKIE['id'])) {
	$res = q("
		SELECT * 
		FROM `users`
		WHERE `id`= ".(int)$_COOKIE['id']."
			AND`hash`='".es($_COOKIE['hash'])."'
		LIMIT 1
		");
	if(mysqli_num_rows($res)) {
		$_SESSION['user'] = mysqli_fetch_assoc($res);
		$status = 'OK';
	}
	else {
		include './modules/cab/exit.php';
	}
}
