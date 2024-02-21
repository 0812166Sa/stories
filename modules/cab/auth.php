<?php
/*
if(!isset($_SESSION['user']) || $_SESSION['user']['access']!=1) {
	exit();
}*/
$link=mysqli_connect('localhost','solo','100587','solotatyana');
if(isset($_POST['login'], $_POST['password'])) {
     
    $res = mysqli_query($link,
		"SELECT * 
		FROM `users2`
		WHERE `login`='".$_POST['login']."'
			AND `password`='".$_POST['password']."'
			AND `active`= 1
		LIMIT 1
	")or exit(mysqli_error($link));
    print_r($res);
	if(mysqli_num_rows($res)) {
		$_SESSION['user'] = mysqli_fetch_assoc($res);
		$status='OK';
	if(isset($_POST['remember'])) {
		$res = q("
			UPDATE `users2` SET
				`hash`='".myHash($_SESSION['user']['id'].$_POST['login'].$_SESSION['user']['email'])."'
			WHERE `login`='".es($_POST['login'])."'
				AND `password`='".es(myHash($_POST['password']))."'
			LIMIT 1
		");
		$res = q("
			SELECT * 
			FROM `users2`
			WHERE `hash`='".myHash($_SESSION['user']['id'].$_POST['login'].$_SESSION['user']['email'])."'
				AND `id`=".(int)$_SESSION['user']['id']."
			LIMIT 1
		");
		if(mysqli_num_rows($res)) {
				setcookie('id', $_SESSION['user']['id'], time() + 3600, '/');
				setcookie('hash', $_SESSION['user']['hash'], time() + 3600, '/');
		}
		}
	} else {
		$error = 'Нет пользователя с таким логином или паролем';
    
    }
}





