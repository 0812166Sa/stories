<?php
$link = mysqli_connect('localhost', 'solo', '100587', 'solotatyana');
error_reporting(-1);
ini_set('display_errors', 1);
mysqli_set_charset($link, 'UTF-8');

if (isset($_POST['login'], $_POST['password'], $_POST['email'])) {
    $errors = [];
    if (empty($_POST['login'])) {
        $errors['login'] = 'Вы не заполнили логин';
    } elseif (mb_strlen($_POST['login']) < 5) {
        $errors['логин'] = 'Ваш логин слишком короткий';
    }
    if (empty($_POST['password'])) {
        $errors['password'] = 'Вы не заполнили пароль';
    } elseif (mb_strlen($_POST['password']) < 4) {
        $errors['password'] = 'Ваш пароль слишком короткий, надо не менее пяти символов';
    }
    if (empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = 'Вы не заполнили емейл';
    }
    if (!$errors) {
        $id = mysqli_insert_id($link);

        $res = mysqli_query(
            $link,
            "INSERT INTO `users2` SET
`login`    = '" . $_POST['login'] . "',
`password` = '" . md5($_POST['password']) . "',
`email`    = '" . $_POST['email'] . "',
`hash`     = '" . md5($_POST['login'] . $_POST['email']) . "'
"
        ) or exit(mysqli_error($link));
        $_SESSION['regok'] = 'ok';
        $id = mysqli_insert_id($link);
        $_SESSION['regok'] = 'ok';
        include './libs/class_Mail.php';
        Mail::$to = $_POST['email'];
        Mail::$subject = 'Вы зарегистрировались на сайте';
        Mail::$text = '<a href="' . Core::$DOMAIN . '/index.php?module=cab&page=activate&id=' . $id . '&hash=' . es(myHash($_POST['login'] . $_POST['email'])) . '">Пройдите по ссылке для активации вашего аккаунта</a>';
        Mail::send();
        header('Location:/cab/registration');
        exit();
    }
}
