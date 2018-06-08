<?php
  $mysqli = new mysqli('localhost', 'root', '', 'is');
 if ($mysqli->connect_error) {
    die('Ошибка подключения (' . $mysqli->connect_errno . ') '
            . $mysqli->connect_error);
}
mysqli_debug("d:t:o,/tmp/client.trace");
$mysqli->set_charset("utf8");
?>	