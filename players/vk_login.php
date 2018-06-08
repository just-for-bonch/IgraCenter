<?php
session_start();
include("../bd.php");

$uid=$_GET['uid'];
$name=$_GET['last_name']." ".$_GET['first_name'];

unset($_SESSION['uid']);
unset($_SESSION['pass']);

if ($_GET['hash']==md5('6499534'.$uid.'GNmJNFCfjYf0rGWqxgN0')) //доверяем вконтактику, и далее полагаем, что пользователь действительно авторизован там,для учетных записей пользователей я решил выделить логины вида vk-********
{
$result = $mysqli->query("SELECT id_user, random_user, hash_user FROM check_user INNER JOIN players ON id_pl=id_user WHERE vk_id_pl = 'id$uid'");

    if (($result->num_rows)==1)
  {
    unset($_SESSION['uid']);
    unset($_SESSION['pass']);
    //пользователь авторизован, просто пересоздадим куки
    $user = $result->fetch_assoc();
      
      $random = mt_rand(100000,999999);
      $pwd=md5($random."gosha ne lomay");
        $mysqli->query("UPDATE players SET name_pl = '$name' WHERE vk_id_pl = 'id$uid' LIMIT 1");
          $mysqli->query("UPDATE check_user SET hash_user='$pwd' WHERE id_user=".$user['id_user']."");
            $mysqli->query("UPDATE check_user SET random_user='$random' WHERE id_user=".$user['id_user']."");
              $mysqli->query("UPDATE check_user SET last_user=NOW() WHERE id_user=".$user['id_user']."");
            
            $_SESSION['pass']=$pwd;
            $_SESSION['uid']=$user['id_user'];
    
    header("Location: game.php");
  } 
  else exit("ВАС НЕТ В СПИСКЕ УЧАСТНИКОВ, ОБРАТИТЕСЬ В СЛУЖБУ ПОДДЕРЖКИ!");
}
else 
  echo "Ошибка авторизации";
$mysqli->close();
?>