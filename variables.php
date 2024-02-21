<?php
if(isset($_GET['route'])) {
	$temp = explode('/',$_GET['route']);
	//wtf($temp);
	if($temp[0]=='admin') {
		Core::$SKIN = 'admin';
		Core::$CONT = Core::$CONT.'/admin'; //Core::$CONT='modules/admin'; Можно менять
		unset ($temp[0]);
	}
	$i=0;
	foreach($temp as $k=>$v) {
		if($i==0) {
				$_GET['module']=$v;

		} elseif($i==1) {
			if(!empty($v)) {
				$_GET['page']=$v;
			}
		} else {
			$_GET['key'.($k-2)]=$v;

		}
	$i++;
	}
	//wtf($_GET);
unset($_GET['route']);
}
/*
$allowed = ['static', 'contacts', 'game', 'errors', 'main', 'skins', 'default',  'program', 'cab', 'comments', 'reviews', 'news', 'goods', 'calcul','users'];
*/
if(!isset($_GET['module'])) {
		$_GET['module'] = 'static';
} else {
	$res = q("
		SELECT *
		FROM `pages`
		WHERE `module`='".es($_GET['module'])."'
		LIMIT 1
	");

	if(!mysqli_num_rows($res)) {
		header("Location: /404");
		exit();
	} else {
		$staticpage = mysqli_fetch_assoc($res);
		if($staticpage['static'] == 1) {
			$_GET['module'] = 'staticpage';
			$_GET['page'] = 'main';
		}
	}
}
/*
elseif(!in_array($_GET['module'], $allowed) && (Core::$SKIN != 'admin')) {
		header("Location: /errors/404");
		exit();
	}
	*/
if(!isset($_GET['page'])) {
	$_GET['page'] = 'main';
}

if(!preg_match('#^[a-z_-]*$#iu',$_GET['page'])) {
	header("Location: /404");
	exit();
}

/*
if(isset($_POST) && count ($_POST)) {
	foreach($_POST as $k => $v) {
		$_POST[$k] = trim($v);
	}
}
*/
