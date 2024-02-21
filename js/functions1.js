function block(id) {
    document.getElementById(id).style.display = 'block';
}

function non(id) {
    document.getElementById(id).style.display = 'none';
}



function ValidMail() {

    var re = /^[\w-\.]+@[\w-]+\.[a-z]{2,4}$/i;
    var myMail = document.getElementById('key2').value;

    var valid = re.test(myMail);

    if (!valid) {
        alert('Адрес электронной почты введен неправильно!');

    }

    //document.getElementById('message2').innerHTML = output;
    return valid;
}
