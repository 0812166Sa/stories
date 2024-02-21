<?php
 if(!isset($_SESSION['regok']))  { ?>
<script type="text/javascript">
    $(function() {
        $('#forma3').on('submit', function(event) {
            event.preventDefault();
            var login = $("#key10").val();
            var password = $("#key20").val();
            var email = $("#key30").val();
            $.ajax({
                type: "POST",
                url: "/modules/cab/registration.php",
                data: {
                    "login": login,
                    "password": password,
                    "email": email
                },
                cache: false,
                success: function(data) {
                    $("#key10").val();
                    $("#key20").val();
                    $("#key30").val();
                    //alert('прошло');
                    alert(login + password + email);
                }
            });
        })
    });

</script>

<div class="auth center">
    <div id="open2">
        <div id="close2" onclick="return non('open2')"></div>
        <form action="" method="post" id="forma3">
            <div class="form1">
                <label class="mail">Login:</label>
                <label><input type="text" name="login" id="key10" size="12" value="<?php if(isset($_POST['login'])) {echo hc($_POST['login']);}?>"></label>
                <?php if(isset($errors['login'])) { echo $errors['login'];}?>
            </div>
            <div class="form1">
                <label>Ваш пароль:</label> <label><input type="password" name="password" id="key20" size="12" value="<?php if(isset($_POST['password'])) {echo hc($_POST['password']);}?>"></label>
                <?php if(isset($errors['password'])) { echo $errors['password'];}?>
            </div>
            <div class="form1">
                <label>Пароль подтвердить:</label> <label><input type="password" name="password2" id="key20" size="12" value="<?php if(isset($_POST['password'])) {echo hc($_POST['password']);}?>"></label>
                <?php if(isset($errors['password'])) { echo $errors['password'];}?>
            </div>
            <div class="form1">
                <label class="email">E-mail:</label>
                <label><input type="text" name="email" id="key30" size="12" value="<?php if(isset($_POST['email'])) {echo hc($_POST['email']);}?>"> </label>
                <?php if(isset($errors['email'])) {echo $errors['email'];}?>
            </div>
            <div class="form2">
                <input type="submit" name="submit" value="Отправить" id="send2" onclick="return non ('open2');" ;>
            </div>
        </form>
        <?php     
    
} else { ?>
        <h1>Вы успешно зарегистрировались на сайте!
        </h1>

    </div>
    <?php
unset($_SESSION['regok']);

}

   
 
