<?php include("check_user.php"); ?>
<!DOCTYPE html>
<html>
<head>
	<title>GAME</title>
</head>
<body>
	<center>
		<h1>Здравствуйте, <?php echo $user['name_pl']; ?>!</h1>
			<h2> Ваша команда <?php echo $user['name_com']; ?></h2>
				<h2> Номер вашей команды <?php echo $user['com_pl']; ?></h2>
			<br>
			<h1>
				<?php 
					$query=$mysqli->query("SELECT * FROM commands_stations WHERE id_com_stat=".$user['com_pl']."");
						$num=$query->num_rows+1; 
							$num=11;
							$query=$mysqli->query("SELECT * FROM table_raz WHERE team_id=".$user['com_pl']."");
							echo $mysqli->error;
							$razvod=$query->fetch_row();
						$station=$razvod[$num];	
							echo "Загадка №".($num);
					?>		
			</h1>
			<br><br>
				<h2>
					<?php
						$query=$mysqli->query("SELECT * FROM stations INNER JOIN zagadki ON id_zag_st=id_zag WHERE id_station=$station");
							$zagadka=$query->fetch_array();
								echo "<img height='400px' src='".$zagadka['img_zag']."'><br>".$zagadka['text_zag'];	
						?>
				</h2>
				<br><br>
			<a href="../exit.php">Выход</a>
	</center>
</body>
</html>