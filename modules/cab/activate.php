<?php

if(isset($_GET['hash'],$_GET['id'])) {
    echo 'jjjjjjjj';
	q("
		UPDATE `users2` SET
			`active` = 1,
			`access` = 1
		WHERE `hash`='".es($_GET['hash'])."'
	");
	$info='Вы активированы';
} else {
	$info='Вы прошли по неверной ссылке';
}
include 'skins/default/cab/activate.tpl';
