<?php
require '../conexion.php';
$IDplaca = $_GET['IDplaca'];
$receta = $_GET['receta'];
$proceso = $_GET['proceso'];
$pasoProceso = $_GET['pasoProceso'];
$estado = $_GET['estado'];
$tiempoRestante = $_GET['tiempoRestante'];
$porcentaje = $_GET['porcentaje'];
//$sql = "INSERT INTO log (IDplaca, proceso, pasoProceso, estado) VALUES ($IDplaca,$proceso,$pasoProceso,$estado)";
$sql = $conn->query("UPDATE info SET IDplaca = $IDplaca, receta = $receta, proceso = $proceso, pasoProceso = $pasoProceso, estado = $estado, tiempoRestante=$tiempoRestante, porcentaje = $porcentaje");
//echo $sql;
?>