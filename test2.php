<?php
session_start();
$link = mysqli_connect('localhost', 'solo', '100587', 'solotatyana');
mysqli_set_charset($link, 'UTF-8');
if (isset($_POST['login'], $_POST['password'])) {

    $result = array(
        'login' => $_POST["login"],
        'password' => $_POST["password"]
    );

    // Переводим массив в JSON

    json_encode($result);
}

$res = mysqli_query(
    $link,
    "SELECT * 
FROM `users2`
WHERE `login`='" . $_POST['login'] . "'
"
) or exit(mysqli_error($link));
//print_r($res);
if (mysqli_num_rows($res)) {
    $_SESSION['user2'] = mysqli_fetch_assoc($res);
    $status = 'OK';
}
