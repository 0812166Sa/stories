<?php

$link = mysqli_connect('localhost', 'solo', '100587', 'solotatyana');
mysqli_set_charset($link, 'UTF-8');
if (isset($_POST['login'], $_POST['password'], $_POST['email'])) {
    if (empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = 'Вы не заполнили емейл';
    }
    $res = mysqli_query(
        $link,
        "INSERT INTO `users2` SET
`login`    = '" . $_POST['login'] . "',
`password` = '" . $_POST['password'] . "',
`email`    = '" . $_POST['email'] . "',
`hash`     = '" . $_POST['login'] . $_POST['email'] . "'
"
    ) or exit(mysqli_error($link));
} else {
    echo 'dddddddd';
}
