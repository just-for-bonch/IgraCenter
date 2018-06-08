<?php
session_start();
include("../bd.php");
if (isset($_SESSION['uid']))
{
    $result=$mysqli->query("SELECT * FROM check_user WHERE id_user=".$_SESSION['uid']."");
if ($result)
    {
        $user = $result->fetch_assoc();
        $check=$user['hash_user'];
            if ($_SESSION['pass']==$check)
                {
                		$query = $mysqli->query("SELECT * FROM check_user INNER JOIN players ON id_pl=id_user INNER JOIN commands ON id_com=com_pl WHERE id_user= ".$_SESSION['uid']."");
							echo $mysqli->error;
								$user=$query->fetch_assoc();
									if ($user['status_user']==1)
									{
										$_SESSION['error']="Ещё не время, возвращайтесь после старта!";
										header("location: error.php");
									}
                }
            else 
            {
                $_SESSION['error']='Не ломайте пожалуйста!';
                header("location: error.php");
            }
    }
}
else
{
	$_SESSION['error']="Ваша страница не найдена, обратитесь в поддержку!";
	header("location: error.php");
}
?>