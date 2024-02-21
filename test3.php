<?php
session_start();
$link = mysqli_connect('localhost', 'solo', '100587', 'solotatyana');
mysqli_set_charset($link, 'UTF-8');
if (isset($_POST['login'], $_POST['email'])) {

    $result2 = array(
        'login' => $_POST["login"],
        'email' => $_POST["email"]
    );

    // Переводим массив в JSON

    json_encode($result2);
}

mysqli_query($link, "
        INSERT INTO `blondes` SET
            `login`='" . $_POST['login'] . "',
            `email` = '" . $_POST['email'] . "',
            `hash` = '" . md5($_POST['login'] . $_POST['email']) . "',
            `date`=NOW()
            ") or exit(mysqli_error($link));

$res = mysqli_query(
    $link,
    "SELECT * 
        FROM `blondes`
        WHERE `login`= `login`='" . $_POST['login'] . "'
"
) or exit(mysqli_error($link));
//print_r($res);
/*
if(mysqli_num_rows($res)) {
    $_SESSION['user2'] = mysqli_fetch_assoc($res);
    $status='OK';
}
*/
