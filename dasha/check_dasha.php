<?php
session_start();
include("../bd.php");
if (isset($_SESSION['uid']))
{
    $result=$mysqli->query("SELECT * FROM check_moders WHERE id_moder=".$_SESSION['uid']."");
        if ($result)
        {
            $user = $result->fetch_assoc();
            $check=$user['hash_moder'];
                if ($_SESSION['pass']==$check)
                {
                	$query = $mysqli->query("SELECT * FROM check_moders INNER JOIN moders ON id_mod=id_moder INNER JOIN stations ON id_station=station_mod WHERE id_moder= ".$_SESSION['uid']."");
					   echo $mysqli->error;
					$user=$query->fetch_assoc();
                }
            else 
            {
                $_SESSION['error']='Не ломайте пожалуйста!';
                echo $_SESSION['error'];
                header("location: error.php");
            }
        }
else
{
	$_SESSION['error']="Ваша страница не найдена, обратитесь в поддержку!";
	echo $_SESSION['error'];
    header("location: error.php");
}
}
?>