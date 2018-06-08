<?php 
	include("check_moder.php");
		if (isset($_POST['timer']))
			{
				$mysqli->query("UPDATE timer_station SET end=NOW() WHERE id_timer=".$_POST['tmr'].""); //заносим конец таймер в базу
					$time=$mysqli->query("SELECT * FROM timer_station WHERE id_timer=".$_POST['tmr']."");
					$timer=$time->fetch_array();

				$start= new DateTime($timer['start']);
				$end= new DateTime($timer['end']);

					$timers=$start->diff($end);//считаем разницу между временем начала и конца
						$minut=$timers->format('%i');
						$sec=$timers->format('%s');
			} 
?>
<!DOCTYPE html>
<html>
<head>
	<title>STATION</title>
		<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
		<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
</head>
<body>
	<center>
			<form method='post'>
				<h3>
					Станция
					<input type="text" name="station" <?php echo "value='".$user['station_mod']." - ".$user['name_station']."' disabled>"?><br>
				Куратор
					<input type="text" name="kurator" <?php echo "value='".$user['id_mod']." - ".$user['name_mod']."' disabled>"?><br>
				Команда
					<select name='comand'>
						<?php 
							$result=$mysqli->query("SELECT * FROM commands");
								while ($coms=$result->fetch_array())
									echo "<option value='".$coms['id_com']."'>".$coms['name_com']."</option>";
						?>
					</select><br>
				<?php 
					echo "Минут:<input type='text' name='min' value=".$minut."><br>
							Секунд:<input type='text' name='sec' value=".$sec.">";?><br>
					<input type='checkbox' name='zagadka'> Загадка отгадана?<br>
				Штраф	
					<select name='straf'>
						<?php 
							$result=$mysqli->query("SELECT * FROM shtraf");
								while ($coms=$result->fetch_array())
									echo "<option value='".$coms['id_shtraf']."'>".$coms['shtraf']."</option>";
						?>
					</select><br>
				<input type='submit' name='send' value='ОТПРАВИТЬ'>
			</form>
		</h3>
		<a href="../exit.php">Выход</a>
	</center>
	<?php
		if (isset($_POST['send']))
		{
			$_POST['sec']=$_POST['sec']+$_POST['min']*60;
		
			if (isset($_POST['zagadka']))
				$zag=1;
			else 
				$zag=0;
		
			$mysqli->query("INSERT INTO commands_stations(id_stat_com, id_com_stat,time_sec,id_shtraf,status_zagadka,id_kur_stat) 
				VALUES (".$user['station_mod'].",".$_POST['comand'].",".$_POST['sec'].",".$_POST['straf'].",$zag,".$user['id_mod'].")");
			
			echo "<script>alert('Метка отправлена!')</script>";
			header("location:start.php");
		
		}

	?>
</body>
</html>