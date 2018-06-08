<?php
session_start();
include("../bd.php");

$uid=$_GET['uid'];
$name=$_GET['last_name']." ".$_GET['first_name'];

unset($_SESSION['uid']);
unset($_SESSION['pass']);

if ($_GET['hash']==md5('6499534'.$uid.'GNmJNFCfjYf0rGWqxgN0')) //доверяем вконтактику, и далее полагаем, что пользователь действительно авторизован там,для учетных записей пользователей я решил выделить логины вида vk-********
{
  $result = $mysqli->query("SELECT * FROM check_moders INNER JOIN moders ON id_mod=id_moder WHERE vk_id_mod = 'id$uid'");
    $user = $result->fetch_assoc();

    if ($user['station_mod']==100)
      {
        unset($_SESSION['uid']);
        unset($_SESSION['pass']);
        //пользователь авторизован, просто пересоздадим куки
          $random = mt_rand(100000,999999);
            $pwd=md5($random."gosha ne lomay");//обновление полей для хэша и имени
              $mysqli->query("UPDATE moders SET name_mod = '$name' WHERE vk_id_mod = 'id$uid' LIMIT 1");
                $mysqli->query("UPDATE check_moders SET hash_moder='$pwd' WHERE id_moder=".$user['id_moder']."");
                  $mysqli->query("UPDATE check_moders SET random_moder='$random' WHERE id_moder=".$user['id_moder']."");
                    $mysqli->query("UPDATE check_moders SET last_moder=NOW() WHERE id_moder=".$user['id_moder']."");
            
            $_SESSION['pass']=$pwd;//основная носимая пользователем инфа
            $_SESSION['uid']=$user['id_moder'];
    
          header("Location: table.php");
      }
    else 
      exit("ВАС НЕТ В WHITE LIST, обратитесь в службу поддержки!"); 
}
else 
  echo "Ошибка авторизации";

$mysqli->close();

?>