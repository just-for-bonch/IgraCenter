<?php 
	include("check_dasha.php");
	$coms=$mysqli->query("SELECT * FROM commands");
		$num_com=$coms->num_rows; 
	$quer="SELECT * FROM commands_stations INNER JOIN shtraf ON id_sht=id_shtraf INNER JOIN commands ON id_com_stat=id_com INNER JOIN moders ON id_mod=id_kur_stat WHERE id_com_stat=";
	?>
<!DOCTYPE html>
<html>
<head>
	<title>Table</title>
</head>
<body>
	<center>
		<h1>Табличка участников</h1>
			<table border="3">
				<thead style="text-align: center; font-size: 18px;">
					<tr>
						<td rowspan='2'>
							Название команды
						</td>
						<td colspan="3">Station 1</td><td colspan="3">Station 2</td><td colspan="3">Station 3</td><td colspan="3">Station 4</td><td colspan="3">Station 5</td>
						<td colspan="3">Station 6</td><td colspan="3">Station 7</td><td colspan="3">Station 8</td><td colspan="3">Station 9</td><td colspan="3">Station 10</td>
						<td rowspan="2">Общая сумма</td>
					</tr>
					<tr>
						<td>Time</td><td>Загадка</td><td>Штраф</td>
						<td>Time</td><td>Загадка</td><td>Штраф</td>
						<td>Time</td><td>Загадка</td><td>Штраф</td>
						<td>Time</td><td>Загадка</td><td>Штраф</td>
						<td>Time</td><td>Загадка</td><td>Штраф</td>
						<td>Time</td><td>Загадка</td><td>Штраф</td>
						<td>Time</td><td>Загадка</td><td>Штраф</td>
						<td>Time</td><td>Загадка</td><td>Штраф</td>
						<td>Time</td><td>Загадка</td><td>Штраф</td>
						<td>Time</td><td>Загадка</td><td>Штраф</td>
					</tr>
				</thead>
				<?php

					for ($i = 1; $i <= $num_com; $i++)
					{
						$time=0;
							echo "<tr style='text-align: center; font-size: 16px;'>";
						$res=$mysqli->query($quer.$i." ORDER BY id_stat_com ASC");
						
						for ($j = 1; $j <= 10; $j++)//первая строка топа
						{
							$c=$res->fetch_array();
							
							if ($j==1)
								echo "<td rowspan='2'>".$c['name_com']."</td>";

								$time=$c['time_sec']+$time+$c['shtraf']-5*$c['status_zagadka'];//считаем время с штрафами и т.п.
									$t[1]=intdiv($c['time_sec'],60);//выводим время без штрафов
									$t[2]=$c['time_sec']%60;

								if ($t[2]<=9)//просто нолик для красоты
									$t[2]="0".$t[2];

								if (isset($c['status_zagadka']))
									echo "<td>0".$t[1].":".$t[2]."</td><td>".$c['status_zagadka']."</td><td>".$c['shtraf']."</td>";
								else
									echo "<td>0".$t[1].":".$t[2]."</td><td></td><td></td>";
						}
							echo "<td rowspan='2'>".(intdiv($time,60)).":".($time%60)."</td>";

							
							echo "</tr><tr style='text-align: center; font-size: 14px;'>";
						$rec=$mysqli->query($quer.$i." ORDER BY id_stat_com ASC");
						
						for ($j = 1; $j <= 10; $j++)//вторая строка топа
						{
							$m=$rec->fetch_array();
							echo "<td colspan='3'>".$m['name_mod']."</td>";
						}
						echo "</tr>";
					}

					?>
			</table>
			<br><br>
			<a href="../exit.php">Выход</a>
	</center>
</body>
</html>