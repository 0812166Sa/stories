function non(id) {
 document.getElementById(id).style.display='none';
                 }

function block2(id) {
    document.getElementById(id).style.display='block';
    document.getElementById('comme').style.marginLeft='600px'; 
}
function block(id) {
    document.getElementById(id).style.display='block';
    document.getElementById('comme').style.marginTop='200px';

}
function check1() {
    var l = document.getElementById('message').value.length;

    if (l<5) { 
        alert('Вы не написали сообщение');
        return false;    
    } else {document.getElementById('cl').style.display='none';

           }
}       