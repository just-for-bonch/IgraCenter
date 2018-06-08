<?php include("check_moder.php");?>
<!DOCTYPE html>
<html>
<head>
	<title>START</title>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
	<script language="JavaScript" type="text/javascript">
	 function init()
            {
                sec = 0;
                setInterval(tick, 1000);
            }
            
            function tick()
            {
                sec++;
                document.getElementById("timer").
                    childNodes[0].nodeValue = sec;
            }
	</script>  
</head>
<body>
	<center>
		<form method="POST">
			<input type="submit" name="start" value="ПРИШЛА КОМАНДА!">
		</form>
		Секундомер: <div id="timer">0</div>
		<?php
			if (isset($_POST['start']))
			{
				echo "<script>init();</script>";
				$mysqli->query("INSERT INTO timer_station(id_st_timer, id_moder_timer,start) VALUES (".$user['station_mod'].",".$user['id_moder'].",NOW())");
					$lid=$mysqli->insert_id;
				echo "<form action='station.php' method='POST'><input type='submit' name='timer' value='Остановить таймер'><input name='tmr' type='text' hidden value=".$lid."></form>";
			}
		?>
		<a href="../exit.php">Выход</a>
	</center>
</body>
</html>