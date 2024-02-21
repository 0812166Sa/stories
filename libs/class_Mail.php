<?php
Class Mail {
	static $subject='';
	static $from='solotatyana12@gmail.com';
    static $to='solotatyana12@gmail.com';
	static $text='';
    static $headers='solotatyana12@gmail.com';
	static function testSend() {
		if(mail(self::$to,'English words','English words')) {
			echo 'Письмо отправилось';
		} else {
				echo 'Письмо не отправилось';
		}
		exit();
	}
	static function send() {
		self::$subject='=?utf-8?b?'. base64_encode(self::$subject) .'?=';
		self::$headers="Content-Type: text/html; charset=\"utf-8\"\r\n";
		self::$headers.="FROM: ".self::$from."\r\n";
		self::$headers.="MIME-Version: 1.0\r\n";
		self::$headers.="Date: ".date('D,d M Y h:i:s O') ."\r\n";
		//self::$headers.= "Presedence:bulk\r\n";
		return mail(self::$to, self::$subject,self::$text,self::$headers);

	}
}
