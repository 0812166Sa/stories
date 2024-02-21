<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="https://fonts.googleapis.com/css?family=Oswald:400,700|Roboto&display=swap" rel="stylesheet">
    <link href="/css/style1.css" rel="stylesheet" type="text/css">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/functions1.js"></script>
    <script type="text/javascript" src="/js/jquary.js"></script>
    <title><?php echo hc(Core::$META['title']); ?>
    </title>
</head>

<body>
    <script>
        function check() {
            var l = document.getElementById('key3').value.length;
            //var l2 = document.getElementById('key2').value.length;
            if (l < 5) {
                alert('Введите не меньше пяти символов');
                return false;
            } else {
                return non('open');
            }
        }

        function ValidMail() {

            var re = /^[\w-\.]+@[\w-]+\.[a-z]{2,4}$/i;
            var myMail = document.getElementById('key2').value;

            var valid = re.test(myMail);

            if (!valid) {
                alert('Адрес электронной почты введен неправильно!');
                return false;

            } else {
                return non('open');
            }

            //document.getElementById('message2').innerHTML = output;
            //return valid;
        }
        //регистрация

        $(function() {
            $('#forma').on('submit', function(event2) {
                event.preventDefault();
                var login = $("#key1").val();
                var email = $("#key2").val();
                let log_pas = $('#forma').serialize();
                $.ajax({
                    type: "POST",
                    url: "test3.php",
                    data: {
                        "login": login,
                        "email": email
                    },
                    success: function(response) {
                        result2 = $.parseJSON(response)
                        $('#result2_form').html('Login' + result2.login + 'Email:' + result2.email);

                        alert('Ваш логин :'result2.login + '<br>'Ваш емайл:'+ result2.email);

                    },
                    error: function(response) { // Данные не отправлены
                        $('#result_form').html('Ошибка. Данные не отправлены.');
                    }


                });
            })
        });

        //авторизация

        $(function() {
            $('#forma2').on('submit', function(event) {
                event.preventDefault();
                var login = $("#key3").val();
                var password = $("#key4").val();
                let log_pas = $('#forma2').serialize();
                $.ajax({
                    type: "POST",
                    url: "test2.php",
                    //data: {"login": login, "password": password},
                    data: log_pas,
                    success: function(response) {
                        result = $.parseJSON(response)
                        alert(login);
                        $('#result_form').html('Логин' + result.login + 'Пароль:' + result.password);

                        alert(result.login + result.password);

                    },
                    error: function(response) { // Данные не отправлены
                        $('#result_form').html('Ошибка. Данные не отправлены.');
                    }


                });
            })
        });

    </script>

    <div class="reg2">
        <div class="center clearfix">
            <?php if(!isset($_COOKIE['hash'], $_COOKIE['id'], $_SESSION['user'])) { ?>
            <div class="vxod" onclick="return block('open');"><b>ВХОД</b></div>
            <div class="rega" onclick="return block('open2');"><b>РЕГИСТРАЦИЯ</b></div>
        </div>
        <div class="clear"></div>

        <?php } else { ?>
        <div class="vxod"><?php if(isset($_SESSION['user']['login']))
echo $_SESSION['user']['login']; ?>
            <a href="/cab/exit">&nbspВЫХОД&nbsp</a>
        </div> <?php
if(isset($_POST['exit'])) { ?>
        <div class="vxod">ВХОД<span>РЕГИСТРАЦИЯ&nbsp</span>

            <?php }
} ?>
            <!-- регистрация -->

            <div id="open2" style="display: none">
                <div id="close" onclick="return non('open2');"></div>
                <form action="" method="post" id="forma">
                    <div class="form1"> <label>Login:</label>
                        <input type="text" name="login" id="key1" size="12">
                    </div>
                    <div class="form1">
                        <label>Email:</label> <input type="text" name="email" id="key2" size="12">
                    </div>
                    <div class="form2">
                        <input type="submit" name="submit" value="Отправить" id="send" onclick="ValidMail();">
                    </div>
                </form>
            </div>

            <!--вход -->

            <div id="open" style="display: none">
                <div id="close" onclick="return non('open');"></div>
                <form action="" method="post" id="forma2">
                    <div class="form1"> <label>Login:</label>
                        <input type="" name="login" id="key3" size="12">
                    </div>
                    <div class="form1">
                        <label>Password:</label> <input type="password" name="password" id="key4" size="12">
                    </div>
                    <div class="form1">
                        <input type="checkbox" name="remember" value="">Запомнить меня
                    </div>
                    <div class="form2">
                        <input type="submit" name="submit" value="Отправить" id="send2">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div id="result_form"></div>
    <div id="result2_form"></div>
    <!--
    <div class="reg2">
        <div class="center clearfix"> <?php /*
if(!isset($_COOKIE['hash'], $_COOKIE['id'], $_SESSION['user'])) { */?>
            <div class="vxod" onclick="return block('open');"><b>ВХОД</b></div>
            <div class="rega" onclick="return block('open2');">
                <b>РЕГИСТРАЦИЯ</b>
            </div>
            <div class="clear"></div>
            <?php /*} else { */?>
            <div class="vxod"><?/*php if(isset($_SESSION['user']['login']))
echo $_SESSION['user']['login']; ?>
                <a href="/cab/exit">&nbspВЫХОД&nbsp</a>
            </div> <?php
if(isset($_POST['exit'])) {*/ ?>
            <div class="vxod">ВХОД<span>РЕГИСТРАЦИЯ&nbsp</span>

                <?/*php }
} */?>
            </div>
        </div>
    
    <div id="open" style="display: none">
        <div id="close" onclick="return non('open');"></div>
        <form action="" method="post" id="forma">
            <div class="form1"> <label>Login:</label>
                <input type="" name="login" id="key1" size="12">
            </div>
            <div class="form1">
                <label>Password:</label> <input type="password" name="password" id="key2" size="12">
            </div>
            <div class="form1">
                <input type="checkbox" name="remember" value="">Запомнить меня
            </div>
            <div class="form2">
                <input type="submit" name="submit" value="Отправить" id="send" onclick="return check();" ;>
            </div>
            <div id="open2" style="display: none">
                <div id="close" onclick="return non('open2');"></div>
                <form action="" method="post" id="forma">
                    <div class="form1"> <label>Login:</label>
                        <input type="" name="login" id="key1" size="12">
                    </div>
                    <div class="form1">
                        <label>Password:</label> <input type="password" name="password" id="key2" size="12">
                    </div>
                    <div class="form1">
                        <input type="checkbox" name="remember" value="">Запомнить меня
                    </div>
                    <div class="form2">
                        <input type="submit" name="submit" value="Отправить" id="send" onclick="return check();" ;>
                    </div>

                </form>
            </div>
        

    </div>
    </div>
-->
    <h2>ЛИСИЦЫНА ТАТЬЯНА</h2>
    <div class="center clearfix">
        <nav class="menu">
            <a href="/" class="active dropmenu">ГЛАВНАЯ</a>
            <a href="/me/about" class="grey dropmenu">ОБО МНЕ</a>
            <a href="/stories/stories" class="dropmenu grey">РАССКАЗЫ</a>
            <a href="/stories/stories" class="grey dropmenu"> ГАЛЕРЕЯ</a>

            <a href="/contacts/contacts" class="dropmenu grey">КОНТАКТЫ</a>
        </nav>
    </div>

    <div id="content">
        <?php echo $content; ?>
    </div>
    <footer>
        <div class="foot center">
            Все авторские права удерживаются<br>
            <a href="/">Лисицына Татьяна</a>
            ©<?php
$y=date('Y');
if(Core::$CREATED < $y) {
echo Core::$CREATED.'-'.$y;
}
else {
echo $y;
} ?>

        </div>

    </footer>

</body>

</html>
