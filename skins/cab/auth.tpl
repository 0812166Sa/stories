<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="/skins/default/css/style1.css" rel="stylesheet" type="text/css">
        <meta charset="UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>     
    </head>
    <script>
        $(function() {
            $('#forma').on('submit', function(event) {
                event.preventDefault();
                var login = $("#key1").val();
                var password = $("#key2").val();
                let log_pas=$('#forma').serialize();
                $.ajax({
                    type: "POST",
                    url: "test2.php",
                    //data: {"login": login, "password": password},
                    data:log_pas,
                    success: function(response) { 
                        result = $.parseJSON(response)
                        alert(login);
                        $('#result_form').html('Логин'+result.login+'Пароль:'+result.password);

                        alert(result.login+result.password);

                    },
                    error: function(response) { // Данные не отправлены
                        $('#result_form').html('Ошибка. Данные не отправлены.');
                    }


                });
            })
        });

    </script>

    <?php
    if(!isset($status) || $status!='OK') {
        $errors = [];
        if(isset($error)) { echo $error; }
        echo 'fafafafaf';
        
?>

    <div class="auth center" >
        <div id="open" style="display: none" >
            <div id="close" onclick="return non('open')"></div>
            <form action="" method="post" id="forma">
                <div class="form1">       
                    <label>Login:</label> 
                    <label><input type="text" name="login" id="key1" size="12"></label>
                </div>
                <div class="form1">
                    <label>Password:</label>      <label><input type="password" name="password"  id="key2" size="12"  ></label>
                </div>
                <div class="form1">
                    <label><input type="checkbox" name="remember" value="">Запомнить меня</label>
                </div>
                <div class="form2">
                    <input type="submit" name="submit" value="Отправить" id="send" >
                </div>
            </form>

        </div>
        

    </div>
    <?php
    } else {
        
        echo 'Поздравляю! Вы авторизированы!';
    } 
